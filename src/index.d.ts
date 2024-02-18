interface Get {
  url: string;
  headers?: any;
  nocache?: boolean;
  tablefy?: boolean;
}

export enum HttpContentType {
  ApplicationJson = 0,
  ApplicationXml = 1,
  ApplicationUrlEncoded = 2,
  TextPlain = 3,
  TextXml = 4,
}

interface Post {
  url: string;
  content_type?: HttpContentType;
  headers?: any;
  body: any;
  compress?: boolean;
  tablefy?: boolean;
}

interface PutDelete {
  url: string;
  headers?: any;
  body?: any;
  tablefy?: boolean;
}

type CustomRequest = PutDelete & {
  method: string;
};

export declare const get: Get;
export declare const post: Post;
export declare const put: PutDelete;
export declare const _delete: PutDelete;
export declare const customRequest: CustomRequest;
