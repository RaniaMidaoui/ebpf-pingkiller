; ModuleID = 'dicmp_kern.c'
source_filename = "dicmp_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr }
%struct.perf_trace_event = type { i64, i32, i8 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@output_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@xdp_dicmp.____fmt = internal constant [17 x i8] c"Got ICMP packet\0A\00", align 1, !dbg !59
@xdp_dicmp.____fmt.1 = internal constant [16 x i8] c"Got TCP packet\0A\00", align 1, !dbg !149
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !154
@llvm.compiler.used = appending global [3 x ptr] [ptr @_license, ptr @output_map, ptr @xdp_dicmp], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_dicmp(ptr noundef %0) #0 section "xdp" !dbg !61 {
  %2 = alloca %struct.perf_trace_event, align 8
  call void @llvm.dbg.value(metadata ptr %0, metadata !76, metadata !DIExpression()), !dbg !188
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #4, !dbg !189
  call void @llvm.dbg.declare(metadata ptr %2, metadata !77, metadata !DIExpression()), !dbg !190
  %3 = getelementptr inbounds i8, ptr %2, i64 8, !dbg !190
  store i64 0, ptr %3, align 8, !dbg !190
  %4 = tail call i64 inttoptr (i64 5 to ptr)() #4, !dbg !191
  store i64 %4, ptr %2, align 8, !dbg !192, !tbaa !193
  %5 = getelementptr inbounds %struct.perf_trace_event, ptr %2, i64 0, i32 2, !dbg !199
  store i8 1, ptr %5, align 4, !dbg !200, !tbaa !201
  %6 = getelementptr inbounds %struct.perf_trace_event, ptr %2, i64 0, i32 1, !dbg !202
  store i32 0, ptr %6, align 8, !dbg !203, !tbaa !204
  %7 = call i64 inttoptr (i64 25 to ptr)(ptr noundef %0, ptr noundef nonnull @output_map, i64 noundef 4294967295, ptr noundef nonnull %2, i64 noundef 16) #4, !dbg !205
  %8 = load i32, ptr %0, align 4, !dbg !206, !tbaa !207
  %9 = zext i32 %8 to i64, !dbg !209
  %10 = inttoptr i64 %9 to ptr, !dbg !210
  call void @llvm.dbg.value(metadata ptr %10, metadata !87, metadata !DIExpression()), !dbg !188
  %11 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1, !dbg !211
  %12 = load i32, ptr %11, align 4, !dbg !211, !tbaa !212
  %13 = zext i32 %12 to i64, !dbg !213
  %14 = inttoptr i64 %13 to ptr, !dbg !214
  call void @llvm.dbg.value(metadata ptr %14, metadata !88, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.value(metadata ptr %10, metadata !89, metadata !DIExpression()), !dbg !188
  %15 = getelementptr i8, ptr %10, i64 14, !dbg !215
  %16 = icmp ugt ptr %15, %14, !dbg !216
  br i1 %16, label %17, label %22, !dbg !217

17:                                               ; preds = %1
  store i8 2, ptr %5, align 4, !dbg !218, !tbaa !201
  %18 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !219
  call void @llvm.dbg.value(metadata i64 %18, metadata !102, metadata !DIExpression()), !dbg !220
  %19 = load i64, ptr %2, align 8, !dbg !221, !tbaa !193
  %20 = sub i64 %18, %19, !dbg !222
  %21 = trunc i64 %20 to i32, !dbg !223
  store i32 %21, ptr %6, align 8, !dbg !224, !tbaa !204
  store i64 %18, ptr %2, align 8, !dbg !225, !tbaa !193
  br label %55

22:                                               ; preds = %1
  %23 = getelementptr inbounds %struct.ethhdr, ptr %10, i64 0, i32 2, !dbg !226
  %24 = load i16, ptr %23, align 1, !dbg !226, !tbaa !227
  %25 = icmp eq i16 %24, 8, !dbg !230
  br i1 %25, label %31, label %26, !dbg !231

26:                                               ; preds = %22
  store i8 3, ptr %5, align 4, !dbg !232, !tbaa !201
  %27 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !233
  call void @llvm.dbg.value(metadata i64 %27, metadata !105, metadata !DIExpression()), !dbg !234
  %28 = load i64, ptr %2, align 8, !dbg !235, !tbaa !193
  %29 = sub i64 %27, %28, !dbg !236
  %30 = trunc i64 %29 to i32, !dbg !237
  store i32 %30, ptr %6, align 8, !dbg !238, !tbaa !204
  store i64 %27, ptr %2, align 8, !dbg !239, !tbaa !193
  br label %55

31:                                               ; preds = %22
  call void @llvm.dbg.value(metadata ptr %15, metadata !108, metadata !DIExpression()), !dbg !188
  %32 = getelementptr i8, ptr %10, i64 34, !dbg !240
  %33 = icmp ugt ptr %32, %14, !dbg !241
  br i1 %33, label %34, label %39, !dbg !242

34:                                               ; preds = %31
  store i8 2, ptr %5, align 4, !dbg !243, !tbaa !201
  %35 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !244
  call void @llvm.dbg.value(metadata i64 %35, metadata !137, metadata !DIExpression()), !dbg !245
  %36 = load i64, ptr %2, align 8, !dbg !246, !tbaa !193
  %37 = sub i64 %35, %36, !dbg !247
  %38 = trunc i64 %37 to i32, !dbg !248
  store i32 %38, ptr %6, align 8, !dbg !249, !tbaa !204
  store i64 %35, ptr %2, align 8, !dbg !250, !tbaa !193
  br label %55

39:                                               ; preds = %31
  %40 = getelementptr i8, ptr %10, i64 23, !dbg !251
  %41 = load i8, ptr %40, align 1, !dbg !251, !tbaa !252
  switch i8 %41, label %50 [
    i8 1, label %42
    i8 6, label %48
  ], !dbg !254

42:                                               ; preds = %39
  %43 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_dicmp.____fmt, i32 noundef 17) #4, !dbg !255
  store i8 2, ptr %5, align 4, !dbg !257, !tbaa !201
  %44 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !258
  call void @llvm.dbg.value(metadata i64 %44, metadata !140, metadata !DIExpression()), !dbg !259
  %45 = load i64, ptr %2, align 8, !dbg !260, !tbaa !193
  %46 = sub i64 %44, %45, !dbg !261
  %47 = trunc i64 %46 to i32, !dbg !262
  store i32 %47, ptr %6, align 8, !dbg !263, !tbaa !204
  store i64 %44, ptr %2, align 8, !dbg !264, !tbaa !193
  br label %55

48:                                               ; preds = %39
  %49 = call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @xdp_dicmp.____fmt.1, i32 noundef 16) #4, !dbg !265
  br label %50, !dbg !268

50:                                               ; preds = %39, %48
  store i8 3, ptr %5, align 4, !dbg !269, !tbaa !201
  %51 = call i64 inttoptr (i64 5 to ptr)() #4, !dbg !270
  call void @llvm.dbg.value(metadata i64 %51, metadata !143, metadata !DIExpression()), !dbg !188
  %52 = load i64, ptr %2, align 8, !dbg !271, !tbaa !193
  %53 = sub i64 %51, %52, !dbg !272
  %54 = trunc i64 %53 to i32, !dbg !273
  store i32 %54, ptr %6, align 8, !dbg !274, !tbaa !204
  store i64 %51, ptr %2, align 8, !dbg !275, !tbaa !193
  br label %55

55:                                               ; preds = %34, %42, %50, %26, %17
  %56 = phi i32 [ 1, %17 ], [ 2, %26 ], [ 1, %34 ], [ 1, %42 ], [ 2, %50 ], !dbg !188
  %57 = call i64 inttoptr (i64 25 to ptr)(ptr noundef nonnull %0, ptr noundef nonnull @output_map, i64 noundef 4294967295, ptr noundef nonnull %2, i64 noundef 16) #4, !dbg !188
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #4, !dbg !276
  ret i32 %56, !dbg !276
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!183, !184, !185, !186}
!llvm.ident = !{!187}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "output_map", scope: !2, file: !3, line: 23, type: !176, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !58, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "dicmp_kern.c", directory: "/home/adam/ebpf/ksp/bpf", checksumkind: CSK_MD5, checksum: "f7f4879ca82a02ea5e21b017d17c36ba")
!4 = !{!5, !12, !20}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 5720, baseType: !7, size: 64, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "9c93a8425305158b421c8b0ca02738ae")
!7 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11}
!9 = !DIEnumerator(name: "BPF_F_INDEX_MASK", value: 4294967295, isUnsigned: true)
!10 = !DIEnumerator(name: "BPF_F_CURRENT_CPU", value: 4294967295, isUnsigned: true)
!11 = !DIEnumerator(name: "BPF_F_CTXLEN_MASK", value: 4503595332403200, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 6052, baseType: !13, size: 32, elements: !14)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!15, !16, !17, !18, !19}
!15 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!16 = !DIEnumerator(name: "XDP_DROP", value: 1)
!17 = !DIEnumerator(name: "XDP_PASS", value: 2)
!18 = !DIEnumerator(name: "XDP_TX", value: 3)
!19 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!20 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !21, line: 29, baseType: !13, size: 32, elements: !22)
!21 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "4444547e35cc687198d1c38c6129c64c")
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51}
!23 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!24 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!25 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!26 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!27 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!28 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!29 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!30 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!31 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!32 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!33 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!34 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!35 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!36 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!37 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!38 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!39 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!40 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!41 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!42 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!43 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!44 = !DIEnumerator(name: "IPPROTO_L2TP", value: 115)
!45 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!46 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!47 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!48 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!49 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!50 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!51 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!52 = !{!53, !54, !55}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !56, line: 24, baseType: !57)
!56 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!57 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!58 = !{!59, !149, !154, !0, !159, !165, !170}
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "____fmt", scope: !61, file: !3, line: 72, type: !144, isLocal: true, isDefinition: true)
!61 = distinct !DISubprogram(name: "xdp_dicmp", scope: !3, file: !3, line: 26, type: !62, scopeLine: 27, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !75)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 6063, size: 192, elements: !67)
!67 = !{!68, !70, !71, !72, !73, !74}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !66, file: !6, line: 6064, baseType: !69, size: 32)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !56, line: 27, baseType: !13)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !66, file: !6, line: 6065, baseType: !69, size: 32, offset: 32)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !66, file: !6, line: 6066, baseType: !69, size: 32, offset: 64)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !66, file: !6, line: 6068, baseType: !69, size: 32, offset: 96)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !66, file: !6, line: 6069, baseType: !69, size: 32, offset: 128)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !66, file: !6, line: 6071, baseType: !69, size: 32, offset: 160)
!75 = !{!76, !77, !87, !88, !89, !102, !105, !108, !137, !140, !143}
!76 = !DILocalVariable(name: "ctx", arg: 1, scope: !61, file: !3, line: 26, type: !65)
!77 = !DILocalVariable(name: "e", scope: !61, file: !3, line: 29, type: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "perf_trace_event", file: !3, line: 9, size: 128, elements: !79)
!79 = !{!80, !83, !84}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !78, file: !3, line: 10, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !56, line: 31, baseType: !82)
!82 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "processing_time_ns", scope: !78, file: !3, line: 11, baseType: !69, size: 32, offset: 64)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !78, file: !3, line: 12, baseType: !85, size: 8, offset: 96)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !56, line: 21, baseType: !86)
!86 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!87 = !DILocalVariable(name: "data", scope: !61, file: !3, line: 36, type: !53)
!88 = !DILocalVariable(name: "data_end", scope: !61, file: !3, line: 37, type: !53)
!89 = !DILocalVariable(name: "eth", scope: !61, file: !3, line: 39, type: !90)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !92, line: 173, size: 112, elements: !93)
!92 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "163f54fb1af2e21fea410f14eb18fa76")
!93 = !{!94, !98, !99}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !91, file: !92, line: 174, baseType: !95, size: 48)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 48, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 6)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !91, file: !92, line: 175, baseType: !95, size: 48, offset: 48)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !91, file: !92, line: 176, baseType: !100, size: 16, offset: 96)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !101, line: 28, baseType: !55)
!101 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "64bcf4b731906682de6e750679b9f4a2")
!102 = !DILocalVariable(name: "ts", scope: !103, file: !3, line: 43, type: !81)
!103 = distinct !DILexicalBlock(scope: !104, file: !3, line: 41, column: 5)
!104 = distinct !DILexicalBlock(scope: !61, file: !3, line: 40, column: 9)
!105 = !DILocalVariable(name: "ts", scope: !106, file: !3, line: 53, type: !81)
!106 = distinct !DILexicalBlock(scope: !107, file: !3, line: 51, column: 5)
!107 = distinct !DILexicalBlock(scope: !61, file: !3, line: 50, column: 9)
!108 = !DILocalVariable(name: "iph", scope: !61, file: !3, line: 60, type: !109)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !111, line: 86, size: 160, elements: !112)
!111 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "fbdafb4648dd1c838bddfe5d71e3770a")
!112 = !{!113, !114, !115, !116, !117, !118, !119, !120, !121, !123}
!113 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !110, file: !111, line: 88, baseType: !85, size: 4, flags: DIFlagBitField, extraData: i64 0)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !110, file: !111, line: 89, baseType: !85, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !110, file: !111, line: 96, baseType: !85, size: 8, offset: 8)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !110, file: !111, line: 97, baseType: !100, size: 16, offset: 16)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !110, file: !111, line: 98, baseType: !100, size: 16, offset: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !110, file: !111, line: 99, baseType: !100, size: 16, offset: 48)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !110, file: !111, line: 100, baseType: !85, size: 8, offset: 64)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !110, file: !111, line: 101, baseType: !85, size: 8, offset: 72)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !110, file: !111, line: 102, baseType: !122, size: 16, offset: 80)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !101, line: 34, baseType: !55)
!123 = !DIDerivedType(tag: DW_TAG_member, scope: !110, file: !111, line: 103, baseType: !124, size: 64, offset: 96)
!124 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !110, file: !111, line: 103, size: 64, elements: !125)
!125 = !{!126, !132}
!126 = !DIDerivedType(tag: DW_TAG_member, scope: !124, file: !111, line: 103, baseType: !127, size: 64)
!127 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !124, file: !111, line: 103, size: 64, elements: !128)
!128 = !{!129, !131}
!129 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !127, file: !111, line: 103, baseType: !130, size: 32)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !101, line: 30, baseType: !69)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !127, file: !111, line: 103, baseType: !130, size: 32, offset: 32)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !124, file: !111, line: 103, baseType: !133, size: 64)
!133 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !124, file: !111, line: 103, size: 64, elements: !134)
!134 = !{!135, !136}
!135 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !133, file: !111, line: 103, baseType: !130, size: 32)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !133, file: !111, line: 103, baseType: !130, size: 32, offset: 32)
!137 = !DILocalVariable(name: "ts", scope: !138, file: !3, line: 64, type: !81)
!138 = distinct !DILexicalBlock(scope: !139, file: !3, line: 62, column: 5)
!139 = distinct !DILexicalBlock(scope: !61, file: !3, line: 61, column: 9)
!140 = !DILocalVariable(name: "ts", scope: !141, file: !3, line: 74, type: !81)
!141 = distinct !DILexicalBlock(scope: !142, file: !3, line: 71, column: 40)
!142 = distinct !DILexicalBlock(scope: !61, file: !3, line: 71, column: 9)
!143 = !DILocalVariable(name: "ts", scope: !61, file: !3, line: 86, type: !81)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !145, size: 136, elements: !147)
!145 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !146)
!146 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!147 = !{!148}
!148 = !DISubrange(count: 17)
!149 = !DIGlobalVariableExpression(var: !150, expr: !DIExpression())
!150 = distinct !DIGlobalVariable(name: "____fmt", scope: !61, file: !3, line: 82, type: !151, isLocal: true, isDefinition: true)
!151 = !DICompositeType(tag: DW_TAG_array_type, baseType: !145, size: 128, elements: !152)
!152 = !{!153}
!153 = !DISubrange(count: 16)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 94, type: !156, isLocal: false, isDefinition: true)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !146, size: 32, elements: !157)
!157 = !{!158}
!158 = !DISubrange(count: 4)
!159 = !DIGlobalVariableExpression(var: !160, expr: !DIExpression())
!160 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !161, line: 114, type: !162, isLocal: true, isDefinition: true)
!161 = !DIFile(filename: "../../libbpf/src/bpf_helper_defs.h", directory: "/home/adam/ebpf/ksp/bpf", checksumkind: CSK_MD5, checksum: "6103e0e453f30c696884072404f9b37d")
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = !DISubroutineType(types: !164)
!164 = !{!81}
!165 = !DIGlobalVariableExpression(var: !166, expr: !DIExpression())
!166 = distinct !DIGlobalVariable(name: "bpf_perf_event_output", scope: !2, file: !161, line: 696, type: !167, isLocal: true, isDefinition: true)
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!168 = !DISubroutineType(types: !169)
!169 = !{!54, !53, !53, !81, !53, !81}
!170 = !DIGlobalVariableExpression(var: !171, expr: !DIExpression())
!171 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !161, line: 177, type: !172, isLocal: true, isDefinition: true)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !173, size: 64)
!173 = !DISubroutineType(types: !174)
!174 = !{!54, !175, !69, null}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!176 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 19, size: 192, elements: !177)
!177 = !{!178, !181, !182}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !176, file: !3, line: 20, baseType: !179, size: 64)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 128, elements: !157)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !176, file: !3, line: 21, baseType: !179, size: 64, offset: 64)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !176, file: !3, line: 22, baseType: !179, size: 64, offset: 128)
!183 = !{i32 7, !"Dwarf Version", i32 5}
!184 = !{i32 2, !"Debug Info Version", i32 3}
!185 = !{i32 1, !"wchar_size", i32 4}
!186 = !{i32 7, !"frame-pointer", i32 2}
!187 = !{!"clang version 15.0.7"}
!188 = !DILocation(line: 0, scope: !61)
!189 = !DILocation(line: 29, column: 5, scope: !61)
!190 = !DILocation(line: 29, column: 29, scope: !61)
!191 = !DILocation(line: 31, column: 19, scope: !61)
!192 = !DILocation(line: 31, column: 17, scope: !61)
!193 = !{!194, !195, i64 0}
!194 = !{!"perf_trace_event", !195, i64 0, !198, i64 8, !196, i64 12}
!195 = !{!"long long", !196, i64 0}
!196 = !{!"omnipotent char", !197, i64 0}
!197 = !{!"Simple C/C++ TBAA"}
!198 = !{!"int", !196, i64 0}
!199 = !DILocation(line: 32, column: 7, scope: !61)
!200 = !DILocation(line: 32, column: 12, scope: !61)
!201 = !{!194, !196, i64 12}
!202 = !DILocation(line: 33, column: 7, scope: !61)
!203 = !DILocation(line: 33, column: 26, scope: !61)
!204 = !{!194, !198, i64 8}
!205 = !DILocation(line: 34, column: 5, scope: !61)
!206 = !DILocation(line: 36, column: 37, scope: !61)
!207 = !{!208, !198, i64 0}
!208 = !{!"xdp_md", !198, i64 0, !198, i64 4, !198, i64 8, !198, i64 12, !198, i64 16, !198, i64 20}
!209 = !DILocation(line: 36, column: 26, scope: !61)
!210 = !DILocation(line: 36, column: 18, scope: !61)
!211 = !DILocation(line: 37, column: 41, scope: !61)
!212 = !{!208, !198, i64 4}
!213 = !DILocation(line: 37, column: 30, scope: !61)
!214 = !DILocation(line: 37, column: 22, scope: !61)
!215 = !DILocation(line: 40, column: 14, scope: !104)
!216 = !DILocation(line: 40, column: 38, scope: !104)
!217 = !DILocation(line: 40, column: 9, scope: !61)
!218 = !DILocation(line: 42, column: 16, scope: !103)
!219 = !DILocation(line: 43, column: 20, scope: !103)
!220 = !DILocation(line: 0, scope: !103)
!221 = !DILocation(line: 44, column: 39, scope: !103)
!222 = !DILocation(line: 44, column: 35, scope: !103)
!223 = !DILocation(line: 44, column: 32, scope: !103)
!224 = !DILocation(line: 44, column: 30, scope: !103)
!225 = !DILocation(line: 45, column: 21, scope: !103)
!226 = !DILocation(line: 50, column: 9, scope: !107)
!227 = !{!228, !229, i64 12}
!228 = !{!"ethhdr", !196, i64 0, !196, i64 6, !229, i64 12}
!229 = !{!"short", !196, i64 0}
!230 = !DILocation(line: 50, column: 33, scope: !107)
!231 = !DILocation(line: 50, column: 9, scope: !61)
!232 = !DILocation(line: 52, column: 16, scope: !106)
!233 = !DILocation(line: 53, column: 20, scope: !106)
!234 = !DILocation(line: 0, scope: !106)
!235 = !DILocation(line: 54, column: 39, scope: !106)
!236 = !DILocation(line: 54, column: 35, scope: !106)
!237 = !DILocation(line: 54, column: 32, scope: !106)
!238 = !DILocation(line: 54, column: 30, scope: !106)
!239 = !DILocation(line: 55, column: 21, scope: !106)
!240 = !DILocation(line: 61, column: 38, scope: !139)
!241 = !DILocation(line: 61, column: 61, scope: !139)
!242 = !DILocation(line: 61, column: 9, scope: !61)
!243 = !DILocation(line: 63, column: 16, scope: !138)
!244 = !DILocation(line: 64, column: 20, scope: !138)
!245 = !DILocation(line: 0, scope: !138)
!246 = !DILocation(line: 65, column: 39, scope: !138)
!247 = !DILocation(line: 65, column: 35, scope: !138)
!248 = !DILocation(line: 65, column: 32, scope: !138)
!249 = !DILocation(line: 65, column: 30, scope: !138)
!250 = !DILocation(line: 66, column: 21, scope: !138)
!251 = !DILocation(line: 71, column: 14, scope: !142)
!252 = !{!253, !196, i64 9}
!253 = !{!"iphdr", !196, i64 0, !196, i64 0, !196, i64 1, !229, i64 2, !229, i64 4, !229, i64 6, !196, i64 8, !196, i64 9, !229, i64 10, !196, i64 12}
!254 = !DILocation(line: 71, column: 9, scope: !61)
!255 = !DILocation(line: 72, column: 9, scope: !256)
!256 = distinct !DILexicalBlock(scope: !141, file: !3, line: 72, column: 9)
!257 = !DILocation(line: 73, column: 16, scope: !141)
!258 = !DILocation(line: 74, column: 20, scope: !141)
!259 = !DILocation(line: 0, scope: !141)
!260 = !DILocation(line: 75, column: 39, scope: !141)
!261 = !DILocation(line: 75, column: 35, scope: !141)
!262 = !DILocation(line: 75, column: 32, scope: !141)
!263 = !DILocation(line: 75, column: 30, scope: !141)
!264 = !DILocation(line: 76, column: 21, scope: !141)
!265 = !DILocation(line: 82, column: 9, scope: !266)
!266 = distinct !DILexicalBlock(scope: !267, file: !3, line: 82, column: 9)
!267 = distinct !DILexicalBlock(scope: !61, file: !3, line: 81, column: 9)
!268 = !DILocation(line: 82, column: 9, scope: !267)
!269 = !DILocation(line: 85, column: 12, scope: !61)
!270 = !DILocation(line: 86, column: 16, scope: !61)
!271 = !DILocation(line: 87, column: 35, scope: !61)
!272 = !DILocation(line: 87, column: 31, scope: !61)
!273 = !DILocation(line: 87, column: 28, scope: !61)
!274 = !DILocation(line: 87, column: 26, scope: !61)
!275 = !DILocation(line: 88, column: 17, scope: !61)
!276 = !DILocation(line: 91, column: 1, scope: !61)
