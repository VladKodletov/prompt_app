class ImageGenerationEntity {
  final String imageUrl;
  
  const ImageGenerationEntity({required this.imageUrl});
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ImageGenerationEntity && other.imageUrl == imageUrl;
  }
  
  @override
  int get hashCode => imageUrl.hashCode;
}