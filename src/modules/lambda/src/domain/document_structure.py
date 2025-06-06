from pydantic import BaseModel


class DocumentStructure(BaseModel):
    content: str # 文書の内容
    keywords: list[str] # 文書の中で重要だと思うキーワード
    is_contain_image: bool # 画像ファイルがあるかどうか