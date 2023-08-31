//MIT License
//
//Copyright (c) 2020 Tom Blind
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import {luaRawLen, luaAssert} from "./luafuncs";

export namespace Format {
    // eslint-disable-next-line @typescript-eslint/consistent-type-assertions
    export const arrayTag = {} as "$arrayTag";

    export interface ExplicitArray {
        [arrayTag]?: boolean;
    }

    export function makeExplicitArray<T = unknown>(arr: T[] = []): T[] {
        (arr as ExplicitArray)[arrayTag] = true;
        return arr;
    }

    const indentStr = "  ";

    const escapes: Record<string, string> = {
        "\n": "\\n",
        "\r": "\\r",
        "\"": "\\\"",
        "\\": "\\\\",
        "\b": "\\b",
        "\f": "\\f",
        "\t": "\\t",
    };

    const escapesPattern = "[\n\r\"\\\b\f\t%z\x01-\x1F]";

    function replaceEscape(char: string) {
        const [byte] = luaAssert(...string.byte(char));
        if (byte >= 0 && byte < 32) { //Control characters
            return string.format("\\u%.4X", byte);
        }
        return luaAssert(escapes[char]);
    }

    function escape(str: string) {
        const [escaped] = str.gsub(escapesPattern, replaceEscape);
        return escaped;
    }

    function isArray(val: AnyTable): val is AnyNotNil[] {
        if ((val as ExplicitArray)[arrayTag]) {
            return true;
        }

        const len = luaRawLen(val);
        if (len === 0) {
            return false;
        }

        for (const [k] of pairs(val)) {
            if (typeof k !== "number" || k > len) {
                return false;
            }
        }
        return true;
    }

    export function asJson(val: AnyNotNil, indent = 0, tables?: LuaTable<AnyNotNil, boolean>): string {
        tables = tables ?? new LuaTable();

        const valType = type(val);
        if (valType === "table" && !tables.get(val)) {
            tables.set(val, true);

            if (isArray(val)) {
                const arrayVals: string[] = [];
                for (const [_, arrayVal] of ipairs(val)) {
                    const valStr = asJson(arrayVal, indent + 1, tables);
                    table.insert(arrayVals, `\n${indentStr.rep(indent + 1)}${valStr}`);
                }
                return `[${table.concat(arrayVals, ",")}\n${indentStr.rep(indent)}]`;

            } else {
                const kvps: string[] = [];
                for (const [k, v] of pairs(val as AnyTable)) {
                    const valStr = asJson(v, indent + 1, tables);
                    table.insert(kvps, `\n${indentStr.rep(indent + 1)}"${escape(tostring(k))}": ${valStr}`);
                }
                return (kvps.length > 0) ? `{${table.concat(kvps, ",")}\n${indentStr.rep(indent)}}` : "{}";
            }

        } else if (valType === "number" || valType === "boolean") {
            return tostring(val);

        } else {
            return `"${escape(tostring(val))}"`;
        }
    }
}
