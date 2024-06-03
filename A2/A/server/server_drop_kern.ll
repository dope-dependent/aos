; ModuleID = 'server_drop_kern.c'
source_filename = "server_drop_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@server_drop.____fmt = internal constant [41 x i8] c"server_drop_kern.c : %d => Got something\00", align 1, !dbg !0
@server_drop.____fmt.1 = internal constant [36 x i8] c"server_drop_kern.c : %d => Aborting\00", align 1, !dbg !69
@server_drop.____fmt.2 = internal constant [47 x i8] c"server_drop_kern.c : %d => Pass non-IP packets\00", align 1, !dbg !76
@server_drop.____fmt.3 = internal constant [36 x i8] c"server_drop_kern.c : %d => Aborting\00", align 1, !dbg !81
@server_drop.____fmt.4 = internal constant [48 x i8] c"server_drop_kern.c : %d => Pass non-UDP packets\00", align 1, !dbg !83
@server_drop.____fmt.5 = internal constant [36 x i8] c"server_drop_kern.c : %d => Aborting\00", align 1, !dbg !88
@server_drop.____fmt.6 = internal constant [64 x i8] c"server_drop_kern.c : %d => UDP Packet Not to our port, passing!\00", align 1, !dbg !90
@server_drop.____fmt.7 = internal constant [61 x i8] c"server_drop_kern.c : %d => UDP Packet Not 4 bytes, aborting!\00", align 1, !dbg !95
@server_drop.____fmt.8 = internal constant [60 x i8] c"server_drop_kern.c : %d => Data [%u] Parity [EVEN] DROPPING\00", align 1, !dbg !100
@server_drop.____fmt.9 = internal constant [58 x i8] c"server_drop_kern.c : %d => Data [%u] Parity [ODD] PASSING\00", align 1, !dbg !105
@LICENSE = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !110
@llvm.compiler.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @LICENSE, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @server_drop to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @server_drop(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp" !dbg !2 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !124, metadata !DIExpression()), !dbg !191
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !192
  %3 = load i32, i32* %2, align 4, !dbg !192, !tbaa !193
  %4 = zext i32 %3 to i64, !dbg !198
  %5 = inttoptr i64 %4 to i8*, !dbg !199
  call void @llvm.dbg.value(metadata i8* %5, metadata !125, metadata !DIExpression()), !dbg !191
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !200
  %7 = load i32, i32* %6, align 4, !dbg !200, !tbaa !201
  %8 = zext i32 %7 to i64, !dbg !202
  %9 = inttoptr i64 %8 to i8*, !dbg !203
  call void @llvm.dbg.value(metadata i8* %9, metadata !126, metadata !DIExpression()), !dbg !191
  %10 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([41 x i8], [41 x i8]* @server_drop.____fmt, i64 0, i64 0), i32 noundef 41, i32 noundef 22) #2, !dbg !204
  call void @llvm.dbg.value(metadata i8* %5, metadata !127, metadata !DIExpression()), !dbg !191
  %11 = getelementptr i8, i8* %5, i64 14, !dbg !206
  %12 = icmp ugt i8* %11, %9, !dbg !208
  br i1 %12, label %13, label %15, !dbg !209

13:                                               ; preds = %1
  %14 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @server_drop.____fmt.1, i64 0, i64 0), i32 noundef 36, i32 noundef 25) #2, !dbg !210
  br label %59, !dbg !213

15:                                               ; preds = %1
  %16 = inttoptr i64 %4 to %struct.ethhdr*, !dbg !214
  call void @llvm.dbg.value(metadata %struct.ethhdr* %16, metadata !127, metadata !DIExpression()), !dbg !191
  %17 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %16, i64 0, i32 2, !dbg !215
  %18 = load i16, i16* %17, align 1, !dbg !215, !tbaa !217
  %19 = icmp eq i16 %18, 8, !dbg !220
  br i1 %19, label %22, label %20, !dbg !221

20:                                               ; preds = %15
  %21 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @server_drop.____fmt.2, i64 0, i64 0), i32 noundef 47, i32 noundef 29) #2, !dbg !222
  br label %59, !dbg !225

22:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i8* %11, metadata !141, metadata !DIExpression()), !dbg !191
  %23 = getelementptr i8, i8* %5, i64 34, !dbg !226
  %24 = icmp ugt i8* %23, %9, !dbg !228
  br i1 %24, label %25, label %27, !dbg !229

25:                                               ; preds = %22
  %26 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @server_drop.____fmt.3, i64 0, i64 0), i32 noundef 36, i32 noundef 34) #2, !dbg !230
  br label %59, !dbg !233

27:                                               ; preds = %22
  call void @llvm.dbg.value(metadata i8* %11, metadata !141, metadata !DIExpression()), !dbg !191
  %28 = getelementptr i8, i8* %5, i64 23, !dbg !234
  %29 = load i8, i8* %28, align 1, !dbg !234, !tbaa !236
  %30 = icmp eq i8 %29, 17, !dbg !238
  br i1 %30, label %33, label %31, !dbg !239

31:                                               ; preds = %27
  %32 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @server_drop.____fmt.4, i64 0, i64 0), i32 noundef 48, i32 noundef 38) #2, !dbg !240
  br label %59, !dbg !243

33:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i8* %23, metadata !171, metadata !DIExpression()), !dbg !191
  %34 = getelementptr i8, i8* %5, i64 42, !dbg !244
  %35 = icmp ugt i8* %34, %9, !dbg !246
  br i1 %35, label %36, label %38, !dbg !247

36:                                               ; preds = %33
  %37 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @server_drop.____fmt.5, i64 0, i64 0), i32 noundef 36, i32 noundef 43) #2, !dbg !248
  br label %59, !dbg !251

38:                                               ; preds = %33
  call void @llvm.dbg.value(metadata i8* %23, metadata !171, metadata !DIExpression()), !dbg !191
  %39 = getelementptr i8, i8* %5, i64 36, !dbg !252
  %40 = bitcast i8* %39 to i16*, !dbg !252
  %41 = load i16, i16* %40, align 2, !dbg !252, !tbaa !253
  call void @llvm.dbg.value(metadata i16 undef, metadata !180, metadata !DIExpression()), !dbg !191
  %42 = icmp eq i16 %41, 20931, !dbg !255
  br i1 %42, label %45, label %43, !dbg !257

43:                                               ; preds = %38
  %44 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([64 x i8], [64 x i8]* @server_drop.____fmt.6, i64 0, i64 0), i32 noundef 64, i32 noundef 48) #2, !dbg !258
  br label %59, !dbg !261

45:                                               ; preds = %38
  call void @llvm.dbg.value(metadata i8* %34, metadata !181, metadata !DIExpression()), !dbg !191
  %46 = getelementptr i8, i8* %5, i64 46, !dbg !262
  %47 = icmp ugt i8* %46, %9, !dbg !264
  br i1 %47, label %48, label %50, !dbg !265

48:                                               ; preds = %45
  %49 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([61 x i8], [61 x i8]* @server_drop.____fmt.7, i64 0, i64 0), i32 noundef 61, i32 noundef 54) #2, !dbg !266
  br label %59, !dbg !269

50:                                               ; preds = %45
  %51 = bitcast i8* %34 to i32*, !dbg !270
  %52 = load i32, i32* %51, align 4, !dbg !271, !tbaa !272
  call void @llvm.dbg.value(metadata i32 %52, metadata !182, metadata !DIExpression()), !dbg !191
  %53 = and i32 %52, 1, !dbg !273
  %54 = icmp eq i32 %53, 0, !dbg !275
  br i1 %54, label %55, label %57, !dbg !276

55:                                               ; preds = %50
  %56 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([60 x i8], [60 x i8]* @server_drop.____fmt.8, i64 0, i64 0), i32 noundef 60, i32 noundef 59, i32 noundef %52) #2, !dbg !277
  br label %59, !dbg !280

57:                                               ; preds = %50
  %58 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @server_drop.____fmt.9, i64 0, i64 0), i32 noundef 58, i32 noundef 63, i32 noundef %52) #2, !dbg !281
  br label %59, !dbg !284

59:                                               ; preds = %25, %31, %43, %55, %57, %48, %36, %20, %13
  %60 = phi i32 [ 0, %13 ], [ 2, %20 ], [ 0, %25 ], [ 2, %31 ], [ 0, %36 ], [ 2, %43 ], [ 0, %48 ], [ 1, %55 ], [ 2, %57 ], !dbg !191
  ret i32 %60, !dbg !285
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!186, !187, !188, !189}
!llvm.ident = !{!190}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 22, type: !183, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "server_drop", scope: !3, file: !3, line: 18, type: !4, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !123)
!3 = !DIFile(filename: "server_drop_kern.c", directory: "/server", checksumkind: CSK_MD5, checksum: "710d23f877f601d5cbc0886d82c1614c")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !9, line: 5442, size: 192, elements: !10)
!9 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "5ad8bc925dae1ec87bbb04b3148b183b")
!10 = !{!11, !15, !16, !17, !18, !19}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !9, line: 5443, baseType: !12, size: 32)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !8, file: !9, line: 5444, baseType: !12, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !8, file: !9, line: 5445, baseType: !12, size: 32, offset: 64)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !8, file: !9, line: 5447, baseType: !12, size: 32, offset: 96)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !8, file: !9, line: 5448, baseType: !12, size: 32, offset: 128)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !8, file: !9, line: 5450, baseType: !12, size: 32, offset: 160)
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !60, globals: !68, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22, !29}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !9, line: 5431, baseType: !14, size: 32, elements: !23)
!23 = !{!24, !25, !26, !27, !28}
!24 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!25 = !DIEnumerator(name: "XDP_DROP", value: 1)
!26 = !DIEnumerator(name: "XDP_PASS", value: 2)
!27 = !DIEnumerator(name: "XDP_TX", value: 3)
!28 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!29 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !30, line: 28, baseType: !14, size: 32, elements: !31)
!30 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!31 = !{!32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59}
!32 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!33 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!34 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!35 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!36 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!37 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!38 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!39 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!40 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!41 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!42 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!43 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!44 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!45 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!46 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!47 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!48 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!49 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!50 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!51 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!52 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!53 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!54 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!55 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!56 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!57 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!58 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!59 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!60 = !{!61, !62, !65, !67}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !63, line: 46, baseType: !64)
!63 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!64 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !66)
!66 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!68 = !{!0, !69, !76, !81, !83, !88, !90, !95, !100, !105, !110, !115}
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 25, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 288, elements: !74)
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !73)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !{!75}
!75 = !DISubrange(count: 36)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 29, type: !78, isLocal: true, isDefinition: true)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 376, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 47)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 34, type: !71, isLocal: true, isDefinition: true)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 38, type: !85, isLocal: true, isDefinition: true)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 384, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 48)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 43, type: !71, isLocal: true, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 48, type: !92, isLocal: true, isDefinition: true)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 512, elements: !93)
!93 = !{!94}
!94 = !DISubrange(count: 64)
!95 = !DIGlobalVariableExpression(var: !96, expr: !DIExpression())
!96 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 54, type: !97, isLocal: true, isDefinition: true)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 488, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 61)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 59, type: !102, isLocal: true, isDefinition: true)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 480, elements: !103)
!103 = !{!104}
!104 = !DISubrange(count: 60)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 63, type: !107, isLocal: true, isDefinition: true)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 464, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 58)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(name: "LICENSE", scope: !20, file: !3, line: 70, type: !112, isLocal: false, isDefinition: true)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !73, size: 32, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 4)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression())
!116 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !117, line: 177, type: !118, isLocal: true, isDefinition: true)
!117 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/server", checksumkind: CSK_MD5, checksum: "5260f06f90b94eed43b746c45e4828c2")
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DISubroutineType(types: !120)
!120 = !{!121, !122, !12, null}
!121 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!123 = !{!124, !125, !126, !127, !141, !171, !180, !181, !182}
!124 = !DILocalVariable(name: "info", arg: 1, scope: !2, file: !3, line: 18, type: !7)
!125 = !DILocalVariable(name: "begin", scope: !2, file: !3, line: 19, type: !61)
!126 = !DILocalVariable(name: "end", scope: !2, file: !3, line: 20, type: !61)
!127 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 23, type: !128)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !130, line: 168, size: 112, elements: !131)
!130 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!131 = !{!132, !137, !138}
!132 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !129, file: !130, line: 169, baseType: !133, size: 48)
!133 = !DICompositeType(tag: DW_TAG_array_type, baseType: !134, size: 48, elements: !135)
!134 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!135 = !{!136}
!136 = !DISubrange(count: 6)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !129, file: !130, line: 170, baseType: !133, size: 48, offset: 48)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !129, file: !130, line: 171, baseType: !139, size: 16, offset: 96)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !140, line: 25, baseType: !65)
!140 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!141 = !DILocalVariable(name: "iph", scope: !2, file: !3, line: 32, type: !142)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !144, line: 87, size: 160, elements: !145)
!144 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!145 = !{!146, !148, !149, !150, !151, !152, !153, !154, !155, !157}
!146 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !143, file: !144, line: 89, baseType: !147, size: 4, flags: DIFlagBitField, extraData: i64 0)
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !134)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !143, file: !144, line: 90, baseType: !147, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !143, file: !144, line: 97, baseType: !147, size: 8, offset: 8)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !143, file: !144, line: 98, baseType: !139, size: 16, offset: 16)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !143, file: !144, line: 99, baseType: !139, size: 16, offset: 32)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !143, file: !144, line: 100, baseType: !139, size: 16, offset: 48)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !143, file: !144, line: 101, baseType: !147, size: 8, offset: 64)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !143, file: !144, line: 102, baseType: !147, size: 8, offset: 72)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !143, file: !144, line: 103, baseType: !156, size: 16, offset: 80)
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !140, line: 31, baseType: !65)
!157 = !DIDerivedType(tag: DW_TAG_member, scope: !143, file: !144, line: 104, baseType: !158, size: 64, offset: 96)
!158 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !143, file: !144, line: 104, size: 64, elements: !159)
!159 = !{!160, !166}
!160 = !DIDerivedType(tag: DW_TAG_member, scope: !158, file: !144, line: 104, baseType: !161, size: 64)
!161 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !158, file: !144, line: 104, size: 64, elements: !162)
!162 = !{!163, !165}
!163 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !161, file: !144, line: 104, baseType: !164, size: 32)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !140, line: 27, baseType: !12)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !161, file: !144, line: 104, baseType: !164, size: 32, offset: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !158, file: !144, line: 104, baseType: !167, size: 64)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !158, file: !144, line: 104, size: 64, elements: !168)
!168 = !{!169, !170}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !167, file: !144, line: 104, baseType: !164, size: 32)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !167, file: !144, line: 104, baseType: !164, size: 32, offset: 32)
!171 = !DILocalVariable(name: "udph", scope: !2, file: !3, line: 41, type: !172)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !173, size: 64)
!173 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !174, line: 23, size: 64, elements: !175)
!174 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!175 = !{!176, !177, !178, !179}
!176 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !173, file: !174, line: 24, baseType: !139, size: 16)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !173, file: !174, line: 25, baseType: !139, size: 16, offset: 16)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !173, file: !174, line: 26, baseType: !139, size: 16, offset: 32)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !173, file: !174, line: 27, baseType: !156, size: 16, offset: 48)
!180 = !DILocalVariable(name: "desport", scope: !2, file: !3, line: 46, type: !65)
!181 = !DILocalVariable(name: "payload", scope: !2, file: !3, line: 52, type: !61)
!182 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 57, type: !12)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 328, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 41)
!186 = !{i32 7, !"Dwarf Version", i32 5}
!187 = !{i32 2, !"Debug Info Version", i32 3}
!188 = !{i32 1, !"wchar_size", i32 4}
!189 = !{i32 7, !"frame-pointer", i32 2}
!190 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!191 = !DILocation(line: 0, scope: !2)
!192 = !DILocation(line: 19, column: 41, scope: !2)
!193 = !{!194, !195, i64 0}
!194 = !{!"xdp_md", !195, i64 0, !195, i64 4, !195, i64 8, !195, i64 12, !195, i64 16, !195, i64 20}
!195 = !{!"int", !196, i64 0}
!196 = !{!"omnipotent char", !197, i64 0}
!197 = !{!"Simple C/C++ TBAA"}
!198 = !DILocation(line: 19, column: 27, scope: !2)
!199 = !DILocation(line: 19, column: 19, scope: !2)
!200 = !DILocation(line: 20, column: 39, scope: !2)
!201 = !{!194, !195, i64 4}
!202 = !DILocation(line: 20, column: 25, scope: !2)
!203 = !DILocation(line: 20, column: 17, scope: !2)
!204 = !DILocation(line: 22, column: 5, scope: !205)
!205 = distinct !DILexicalBlock(scope: !2, file: !3, line: 22, column: 5)
!206 = !DILocation(line: 24, column: 15, scope: !207)
!207 = distinct !DILexicalBlock(scope: !2, file: !3, line: 24, column: 9)
!208 = !DILocation(line: 24, column: 39, scope: !207)
!209 = !DILocation(line: 24, column: 9, scope: !2)
!210 = !DILocation(line: 25, column: 9, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !3, line: 25, column: 9)
!212 = distinct !DILexicalBlock(scope: !207, file: !3, line: 24, column: 46)
!213 = !DILocation(line: 26, column: 9, scope: !212)
!214 = !DILocation(line: 23, column: 26, scope: !2)
!215 = !DILocation(line: 28, column: 9, scope: !216)
!216 = distinct !DILexicalBlock(scope: !2, file: !3, line: 28, column: 9)
!217 = !{!218, !219, i64 12}
!218 = !{!"ethhdr", !196, i64 0, !196, i64 6, !219, i64 12}
!219 = !{!"short", !196, i64 0}
!220 = !DILocation(line: 28, column: 33, scope: !216)
!221 = !DILocation(line: 28, column: 9, scope: !2)
!222 = !DILocation(line: 29, column: 9, scope: !223)
!223 = distinct !DILexicalBlock(scope: !224, file: !3, line: 29, column: 9)
!224 = distinct !DILexicalBlock(scope: !216, file: !3, line: 28, column: 46)
!225 = !DILocation(line: 30, column: 9, scope: !224)
!226 = !DILocation(line: 33, column: 39, scope: !227)
!227 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 9)
!228 = !DILocation(line: 33, column: 62, scope: !227)
!229 = !DILocation(line: 33, column: 9, scope: !2)
!230 = !DILocation(line: 34, column: 9, scope: !231)
!231 = distinct !DILexicalBlock(scope: !232, file: !3, line: 34, column: 9)
!232 = distinct !DILexicalBlock(scope: !227, file: !3, line: 33, column: 69)
!233 = !DILocation(line: 35, column: 9, scope: !232)
!234 = !DILocation(line: 37, column: 14, scope: !235)
!235 = distinct !DILexicalBlock(scope: !2, file: !3, line: 37, column: 9)
!236 = !{!237, !196, i64 9}
!237 = !{!"iphdr", !196, i64 0, !196, i64 0, !196, i64 1, !219, i64 2, !219, i64 4, !219, i64 6, !196, i64 8, !196, i64 9, !219, i64 10, !196, i64 12}
!238 = !DILocation(line: 37, column: 23, scope: !235)
!239 = !DILocation(line: 37, column: 9, scope: !2)
!240 = !DILocation(line: 38, column: 9, scope: !241)
!241 = distinct !DILexicalBlock(scope: !242, file: !3, line: 38, column: 9)
!242 = distinct !DILexicalBlock(scope: !235, file: !3, line: 37, column: 39)
!243 = !DILocation(line: 39, column: 9, scope: !242)
!244 = !DILocation(line: 42, column: 62, scope: !245)
!245 = distinct !DILexicalBlock(scope: !2, file: !3, line: 42, column: 9)
!246 = !DILocation(line: 42, column: 86, scope: !245)
!247 = !DILocation(line: 42, column: 9, scope: !2)
!248 = !DILocation(line: 43, column: 9, scope: !249)
!249 = distinct !DILexicalBlock(scope: !250, file: !3, line: 43, column: 9)
!250 = distinct !DILexicalBlock(scope: !245, file: !3, line: 42, column: 93)
!251 = !DILocation(line: 44, column: 9, scope: !250)
!252 = !DILocation(line: 46, column: 21, scope: !2)
!253 = !{!254, !219, i64 2}
!254 = !{!"udphdr", !219, i64 0, !219, i64 2, !219, i64 4, !219, i64 6}
!255 = !DILocation(line: 47, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !2, file: !3, line: 47, column: 9)
!257 = !DILocation(line: 47, column: 9, scope: !2)
!258 = !DILocation(line: 48, column: 9, scope: !259)
!259 = distinct !DILexicalBlock(scope: !260, file: !3, line: 48, column: 9)
!260 = distinct !DILexicalBlock(scope: !256, file: !3, line: 47, column: 33)
!261 = !DILocation(line: 49, column: 9, scope: !260)
!262 = !DILocation(line: 53, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !2, file: !3, line: 53, column: 9)
!264 = !DILocation(line: 53, column: 33, scope: !263)
!265 = !DILocation(line: 53, column: 9, scope: !2)
!266 = !DILocation(line: 54, column: 9, scope: !267)
!267 = distinct !DILexicalBlock(scope: !268, file: !3, line: 54, column: 9)
!268 = distinct !DILexicalBlock(scope: !263, file: !3, line: 53, column: 40)
!269 = !DILocation(line: 55, column: 9, scope: !268)
!270 = !DILocation(line: 57, column: 19, scope: !2)
!271 = !DILocation(line: 57, column: 18, scope: !2)
!272 = !{!195, !195, i64 0}
!273 = !DILocation(line: 58, column: 14, scope: !274)
!274 = distinct !DILexicalBlock(scope: !2, file: !3, line: 58, column: 9)
!275 = !DILocation(line: 58, column: 18, scope: !274)
!276 = !DILocation(line: 58, column: 9, scope: !2)
!277 = !DILocation(line: 59, column: 9, scope: !278)
!278 = distinct !DILexicalBlock(scope: !279, file: !3, line: 59, column: 9)
!279 = distinct !DILexicalBlock(scope: !274, file: !3, line: 58, column: 24)
!280 = !DILocation(line: 60, column: 9, scope: !279)
!281 = !DILocation(line: 63, column: 9, scope: !282)
!282 = distinct !DILexicalBlock(scope: !283, file: !3, line: 63, column: 9)
!283 = distinct !DILexicalBlock(scope: !274, file: !3, line: 62, column: 10)
!284 = !DILocation(line: 64, column: 9, scope: !283)
!285 = !DILocation(line: 68, column: 1, scope: !2)
