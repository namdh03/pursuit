export default function html([first, ...strings], ...values) {
    return values
        .reduce((acc, cur) => acc.concat(cur, strings.shift()), [first])
        .filter((e) => (e && e !== true) || e === 0)
        .join("");
}
