export function getOffsetOfPagination(pageIndex: number, pageSize: number): number {
    return (pageIndex - 1) * pageSize;
}