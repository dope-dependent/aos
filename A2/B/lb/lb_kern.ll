; ModuleID = 'lb_kern.c'
source_filename = "lb_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.1 = type { [2 x i32]*, i32*, i32*, [1 x i32]* }
%struct.anon.2 = type { [22 x i32]*, i32*, [1024 x i32]* }
%struct.anon.3 = type { [2 x i32]*, i32*, %struct.backend_info*, [3 x i32]* }
%struct.backend_info = type { i32, i32, i16, [6 x i8] }
%struct.anon.4 = type { [1 x i32]*, i32*, i32*, [3 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@lb_kernel_code.____fmt = internal constant [22 x i8] c"%d => [CLIENT PACKET]\00", align 1, !dbg !0
@lb_servers_init = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !215
@lb_kernel_code.____fmt.1 = internal constant [51 x i8] c"%d => [QUEUE] Using queue, no server is available!\00", align 1, !dbg !90
@lb_queue = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8, !dbg !251
@lb_kernel_code.____fmt.2 = internal constant [68 x i8] c"%d => [QUEUE] Unable to push to queue, queue full ! Dropping Packet\00", align 1, !dbg !97
@lb_kernel_code.____fmt.3 = internal constant [55 x i8] c"%d => [QUEUE] Using queue, packet successfully queued!\00", align 1, !dbg !102
@lb_capacity = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !231
@lb_kernel_code.____fmt.4 = internal constant [73 x i8] c"%d => Critical Error: Unable to get info of server [%u]! Dropping Packet\00", align 1, !dbg !107
@lb_kernel_code.____fmt.5 = internal constant [73 x i8] c"%d => Critical Error: Unable to get info of server [%u]! Dropping Packet\00", align 1, !dbg !112
@lb_kernel_code.____fmt.6 = internal constant [73 x i8] c"%d => Critical Error: Unable to get info of server [%u]! Dropping Packet\00", align 1, !dbg !114
@lb_kernel_code.____fmt.7 = internal constant [49 x i8] c"%d => [QUEUE] All servers are busy! Using queue!\00", align 1, !dbg !116
@lb_kernel_code.____fmt.8 = internal constant [68 x i8] c"%d => [QUEUE] Unable to push to queue, queue full ! Dropping Packet\00", align 1, !dbg !121
@lb_kernel_code.____fmt.9 = internal constant [55 x i8] c"%d => [QUEUE] Using queue, packet successfully queued!\00", align 1, !dbg !123
@lb_kernel_code.____fmt.10 = internal constant [59 x i8] c"%d => Updating the value of active threads in [%pI4] to %u\00", align 1, !dbg !125
@lb_kernel_code.____fmt.11 = internal constant [73 x i8] c"%d => Critical Error: Unable to get info of server [%u]! Dropping Packet\00", align 1, !dbg !130
@lb_kernel_code.____fmt.12 = internal constant [76 x i8] c"%d => Critical Error: Unable to update active threads [%u]! Dropping Packet\00", align 1, !dbg !132
@lb_kernel_code.____fmt.13 = internal constant [45 x i8] c"%d => Changing packet and sending to [%pI4]!\00", align 1, !dbg !137
@lb_kernel_code.____fmt.14 = internal constant [53 x i8] c"%d => Successfully changed packet! Sending to [%pI4]\00", align 1, !dbg !142
@lb_kernel_code.____fmt.15 = internal constant [23 x i8] c"%d => [BACKEND PACKET]\00", align 1, !dbg !147
@lb_ip_to_index = dso_local global %struct.anon.4 zeroinitializer, section ".maps", align 8, !dbg !243
@lb_kernel_code.____fmt.16 = internal constant [50 x i8] c"%d => Updating lb_ip_to_index: new backend [%pI4]\00", align 1, !dbg !152
@lb_kernel_code.____fmt.17 = internal constant [58 x i8] c"%d => Error in adding to lb_ip_to_index! Dropping Packet!\00", align 1, !dbg !157
@lb_kernel_code.____fmt.18 = internal constant [47 x i8] c"%d => Updating lb_capacity: new backend [%pI4]\00", align 1, !dbg !162
@lb_kernel_code.____fmt.19 = internal constant [54 x i8] c"%d => Error in updating lb_capacity! Dropping Packet!\00", align 1, !dbg !167
@lb_kernel_code.____fmt.20 = internal constant [51 x i8] c"%d => Updating lb_servers_init: new backend [%pI4]\00", align 1, !dbg !172
@lb_kernel_code.____fmt.21 = internal constant [58 x i8] c"%d => Error in updating lb_servers_init! Dropping Packet!\00", align 1, !dbg !174
@lb_kernel_code.____fmt.22 = internal constant [38 x i8] c"%d => Successfully added new backend!\00", align 1, !dbg !176
@lb_kernel_code.____fmt.23 = internal constant [57 x i8] c"%d => Error in EBPF CODE: Failed to add entry for server\00", align 1, !dbg !181
@lb_kernel_code.____fmt.24 = internal constant [44 x i8] c"%d => Incrementing Capacity at [%pI4] to %u\00", align 1, !dbg !186
@lb_kernel_code.____fmt.25 = internal constant [52 x i8] c"%d => Cannot increment capacity at [%pI4] beyond %u\00", align 1, !dbg !191
@lb_kernel_code.____fmt.26 = internal constant [48 x i8] c"%d => Error in incrementing capacity of server!\00", align 1, !dbg !196
@lb_kernel_code.____fmt.27 = internal constant [51 x i8] c"%d => Extending payload tail and sending to [%pI4]\00", align 1, !dbg !201
@lb_kernel_code.____fmt.28 = internal constant [80 x i8] c"%d => Error in extending tail of ping packet from [%pI4]. Dropping ping packet!\00", align 1, !dbg !203
@lb_kernel_code.____fmt.29 = internal constant [54 x i8] c"%d => Modified retrieved packet and sending to [%pI4]\00", align 1, !dbg !208
@LICENSE = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !210
@llvm.compiler.used = appending global [6 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @LICENSE, i32 0, i32 0), i8* bitcast (%struct.anon.3* @lb_capacity to i8*), i8* bitcast (%struct.anon.4* @lb_ip_to_index to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @lb_kernel_code to i8*), i8* bitcast (%struct.anon.2* @lb_queue to i8*), i8* bitcast (%struct.anon.1* @lb_servers_init to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @lb_kernel_code(%struct.xdp_md* noundef %0) #0 section "xdp" !dbg !2 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.backend_info, align 4
  %8 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !304, metadata !DIExpression()), !dbg !407
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !408
  %10 = load i32, i32* %9, align 4, !dbg !408, !tbaa !409
  %11 = zext i32 %10 to i64, !dbg !414
  %12 = inttoptr i64 %11 to i8*, !dbg !415
  call void @llvm.dbg.value(metadata i8* %12, metadata !305, metadata !DIExpression()), !dbg !407
  %13 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !416
  %14 = load i32, i32* %13, align 4, !dbg !416, !tbaa !417
  %15 = zext i32 %14 to i64, !dbg !418
  %16 = inttoptr i64 %15 to i8*, !dbg !419
  call void @llvm.dbg.value(metadata i8* %16, metadata !306, metadata !DIExpression()), !dbg !407
  %17 = inttoptr i64 %11 to %struct.ethhdr*, !dbg !420
  call void @llvm.dbg.value(metadata %struct.ethhdr* %17, metadata !307, metadata !DIExpression()), !dbg !407
  %18 = getelementptr i8, i8* %12, i64 14, !dbg !421
  %19 = icmp ugt i8* %18, %16, !dbg !423
  br i1 %19, label %477, label %20, !dbg !424

20:                                               ; preds = %1
  %21 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %17, i64 0, i32 2, !dbg !425
  %22 = load i16, i16* %21, align 1, !dbg !425, !tbaa !427
  %23 = icmp eq i16 %22, 8, !dbg !430
  br i1 %23, label %24, label %477, !dbg !431

24:                                               ; preds = %20
  call void @llvm.dbg.value(metadata i8* %18, metadata !318, metadata !DIExpression()), !dbg !407
  %25 = getelementptr i8, i8* %12, i64 34, !dbg !432
  %26 = icmp ugt i8* %25, %16, !dbg !434
  br i1 %26, label %477, label %27, !dbg !435

27:                                               ; preds = %24
  %28 = getelementptr i8, i8* %12, i64 23, !dbg !436
  %29 = load i8, i8* %28, align 1, !dbg !436, !tbaa !438
  %30 = icmp eq i8 %29, 17, !dbg !440
  br i1 %30, label %31, label %477, !dbg !441

31:                                               ; preds = %27
  call void @llvm.dbg.value(metadata i8* %25, metadata !347, metadata !DIExpression()), !dbg !407
  %32 = getelementptr i8, i8* %12, i64 42, !dbg !442
  %33 = icmp ugt i8* %32, %16, !dbg !444
  br i1 %33, label %477, label %34, !dbg !445

34:                                               ; preds = %31
  %35 = getelementptr i8, i8* %12, i64 36, !dbg !446
  %36 = bitcast i8* %35 to i16*, !dbg !446
  %37 = load i16, i16* %36, align 2, !dbg !446, !tbaa !447
  call void @llvm.dbg.value(metadata i16 %37, metadata !356, metadata !DIExpression()), !dbg !407
  %38 = icmp eq i16 %37, 20931, !dbg !449
  br i1 %38, label %39, label %477, !dbg !451

39:                                               ; preds = %34
  %40 = ptrtoint i8* %32 to i64, !dbg !452
  %41 = trunc i64 %40 to i32, !dbg !453
  %42 = sub i32 %14, %41, !dbg !453
  call void @llvm.dbg.value(metadata i32 %42, metadata !357, metadata !DIExpression()), !dbg !407
  %43 = icmp eq i32 %42, 4, !dbg !454
  br i1 %43, label %44, label %259, !dbg !455

44:                                               ; preds = %39
  %45 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @lb_kernel_code.____fmt, i64 0, i64 0), i32 noundef 22, i32 noundef 144) #5, !dbg !456
  %46 = bitcast i32* %2 to i8*, !dbg !458
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %46) #5, !dbg !458
  call void @llvm.dbg.value(metadata i32 0, metadata !358, metadata !DIExpression()), !dbg !459
  store i32 0, i32* %2, align 4, !dbg !460, !tbaa !461
  call void @llvm.dbg.value(metadata i32 0, metadata !361, metadata !DIExpression()), !dbg !459
  %47 = bitcast i32* %3 to i8*, !dbg !462
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %47) #5, !dbg !462
  call void @llvm.dbg.value(metadata i32 0, metadata !362, metadata !DIExpression()), !dbg !459
  store i32 0, i32* %3, align 4, !dbg !463, !tbaa !461
  call void @llvm.dbg.value(metadata i32* %2, metadata !358, metadata !DIExpression(DW_OP_deref)), !dbg !459
  %48 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.1* @lb_servers_init to i8*), i8* noundef nonnull %46) #5, !dbg !464
  %49 = bitcast i8* %48 to i32*, !dbg !465
  call void @llvm.dbg.value(metadata i32* %49, metadata !363, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata %struct.backend_info* null, metadata !364, metadata !DIExpression()), !dbg !459
  %50 = icmp eq i8* %48, null, !dbg !466
  br i1 %50, label %54, label %51, !dbg !467

51:                                               ; preds = %44
  %52 = load i32, i32* %49, align 4, !dbg !468, !tbaa !461
  %53 = icmp eq i32 %52, 0, !dbg !469
  br i1 %53, label %54, label %65, !dbg !470

54:                                               ; preds = %51, %44
  %55 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([51 x i8], [51 x i8]* @lb_kernel_code.____fmt.1, i64 0, i64 0), i32 noundef 51, i32 noundef 151) #5, !dbg !471
  call void @llvm.dbg.value(metadata i8* %32, metadata !365, metadata !DIExpression()), !dbg !473
  %56 = getelementptr i8, i8* %12, i64 46, !dbg !474
  %57 = icmp ugt i8* %56, %16, !dbg !476
  br i1 %57, label %257, label %58, !dbg !477

58:                                               ; preds = %54
  %59 = call i64 inttoptr (i64 87 to i64 (i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.2* @lb_queue to i8*), i8* noundef %32, i64 noundef 2) #5, !dbg !478
  call void @llvm.dbg.value(metadata i64 %59, metadata !368, metadata !DIExpression()), !dbg !473
  %60 = icmp slt i64 %59, 0, !dbg !479
  br i1 %60, label %61, label %63, !dbg !481

61:                                               ; preds = %58
  %62 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([68 x i8], [68 x i8]* @lb_kernel_code.____fmt.2, i64 0, i64 0), i32 noundef 68, i32 noundef 158) #5, !dbg !482
  br label %257, !dbg !485

63:                                               ; preds = %58
  %64 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([55 x i8], [55 x i8]* @lb_kernel_code.____fmt.3, i64 0, i64 0), i32 noundef 55, i32 noundef 161) #5, !dbg !486
  br label %257, !dbg !488

65:                                               ; preds = %51
  call void @llvm.dbg.value(metadata i32* %2, metadata !358, metadata !DIExpression(DW_OP_deref)), !dbg !459
  %66 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %46) #5, !dbg !489
  call void @llvm.dbg.value(metadata i8* %66, metadata !364, metadata !DIExpression()), !dbg !459
  %67 = icmp eq i8* %66, null, !dbg !492
  br i1 %67, label %68, label %71, !dbg !494

68:                                               ; preds = %65
  %69 = load i32, i32* %2, align 4, !dbg !495, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %69, metadata !358, metadata !DIExpression()), !dbg !459
  %70 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @lb_kernel_code.____fmt.4, i64 0, i64 0), i32 noundef 73, i32 noundef 168, i32 noundef %69) #5, !dbg !495
  br label %257, !dbg !498

71:                                               ; preds = %65
  %72 = getelementptr inbounds i8, i8* %66, i64 4, !dbg !499
  %73 = bitcast i8* %72 to i32*, !dbg !499
  %74 = load i32, i32* %73, align 4, !dbg !499, !tbaa !501
  %75 = icmp eq i32 %74, 0, !dbg !503
  %76 = load i32, i32* %2, align 4, !dbg !504, !tbaa !461
  br i1 %75, label %78, label %77, !dbg !505

77:                                               ; preds = %71
  call void @llvm.dbg.value(metadata i32 %74, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %76, metadata !358, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %76, metadata !362, metadata !DIExpression()), !dbg !459
  store i32 %76, i32* %3, align 4, !dbg !506, !tbaa !461
  br label %78, !dbg !508

78:                                               ; preds = %71, %77
  call void @llvm.dbg.value(metadata i32 %74, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %76, metadata !358, metadata !DIExpression()), !dbg !459
  %79 = add i32 %76, 1, !dbg !509
  call void @llvm.dbg.value(metadata i32 %79, metadata !358, metadata !DIExpression()), !dbg !459
  store i32 %79, i32* %2, align 4, !dbg !509, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %74, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i8* %66, metadata !364, metadata !DIExpression()), !dbg !459
  %80 = load i32, i32* %49, align 4, !dbg !510, !tbaa !461
  %81 = icmp ugt i32 %80, 1, !dbg !512
  br i1 %81, label %82, label %116, !dbg !513

82:                                               ; preds = %78
  call void @llvm.dbg.value(metadata i32* %2, metadata !358, metadata !DIExpression(DW_OP_deref)), !dbg !459
  %83 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %46) #5, !dbg !514
  call void @llvm.dbg.value(metadata i8* %83, metadata !364, metadata !DIExpression()), !dbg !459
  %84 = icmp eq i8* %83, null, !dbg !516
  br i1 %84, label %85, label %88, !dbg !518

85:                                               ; preds = %82
  %86 = load i32, i32* %2, align 4, !dbg !519, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %86, metadata !358, metadata !DIExpression()), !dbg !459
  %87 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @lb_kernel_code.____fmt.5, i64 0, i64 0), i32 noundef 73, i32 noundef 181, i32 noundef %86) #5, !dbg !519
  br label %257, !dbg !522

88:                                               ; preds = %82
  %89 = getelementptr inbounds i8, i8* %83, i64 4, !dbg !523
  %90 = bitcast i8* %89 to i32*, !dbg !523
  %91 = load i32, i32* %90, align 4, !dbg !523, !tbaa !501
  %92 = icmp ugt i32 %91, %74, !dbg !525
  %93 = load i32, i32* %2, align 4, !dbg !526, !tbaa !461
  br i1 %92, label %94, label %95, !dbg !527

94:                                               ; preds = %88
  call void @llvm.dbg.value(metadata i32 %91, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %93, metadata !358, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %93, metadata !362, metadata !DIExpression()), !dbg !459
  store i32 %93, i32* %3, align 4, !dbg !528, !tbaa !461
  br label %95, !dbg !530

95:                                               ; preds = %88, %94
  %96 = phi i32 [ %91, %94 ], [ %74, %88 ], !dbg !459
  call void @llvm.dbg.value(metadata i32 %96, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %93, metadata !358, metadata !DIExpression()), !dbg !459
  %97 = add i32 %93, 1, !dbg !531
  call void @llvm.dbg.value(metadata i32 %97, metadata !358, metadata !DIExpression()), !dbg !459
  store i32 %97, i32* %2, align 4, !dbg !531, !tbaa !461
  %98 = load i32, i32* %49, align 4, !dbg !532, !tbaa !461
  call void @llvm.dbg.value(metadata i8* %83, metadata !364, metadata !DIExpression()), !dbg !459
  %99 = icmp ugt i32 %98, 2, !dbg !534
  br i1 %99, label %100, label %116, !dbg !535

100:                                              ; preds = %95
  call void @llvm.dbg.value(metadata i32* %2, metadata !358, metadata !DIExpression(DW_OP_deref)), !dbg !459
  %101 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %46) #5, !dbg !536
  call void @llvm.dbg.value(metadata i8* %101, metadata !364, metadata !DIExpression()), !dbg !459
  %102 = icmp eq i8* %101, null, !dbg !538
  br i1 %102, label %103, label %106, !dbg !540

103:                                              ; preds = %100
  %104 = load i32, i32* %2, align 4, !dbg !541, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %104, metadata !358, metadata !DIExpression()), !dbg !459
  %105 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @lb_kernel_code.____fmt.6, i64 0, i64 0), i32 noundef 73, i32 noundef 194, i32 noundef %104) #5, !dbg !541
  br label %257, !dbg !544

106:                                              ; preds = %100
  %107 = getelementptr inbounds i8, i8* %101, i64 4, !dbg !545
  %108 = bitcast i8* %107 to i32*, !dbg !545
  %109 = load i32, i32* %108, align 4, !dbg !545, !tbaa !501
  %110 = icmp ugt i32 %109, %96, !dbg !547
  %111 = load i32, i32* %2, align 4, !dbg !548, !tbaa !461
  br i1 %110, label %112, label %113, !dbg !549

112:                                              ; preds = %106
  call void @llvm.dbg.value(metadata i32 %109, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %111, metadata !358, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %111, metadata !362, metadata !DIExpression()), !dbg !459
  store i32 %111, i32* %3, align 4, !dbg !550, !tbaa !461
  br label %113, !dbg !552

113:                                              ; preds = %106, %112
  %114 = phi i32 [ %109, %112 ], [ %96, %106 ], !dbg !459
  call void @llvm.dbg.value(metadata i32 %114, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i32 %111, metadata !358, metadata !DIExpression()), !dbg !459
  %115 = add i32 %111, 1, !dbg !553
  call void @llvm.dbg.value(metadata i32 %115, metadata !358, metadata !DIExpression()), !dbg !459
  store i32 %115, i32* %2, align 4, !dbg !553, !tbaa !461
  br label %116, !dbg !554

116:                                              ; preds = %78, %113, %95
  %117 = phi i32 [ %109, %113 ], [ %91, %95 ], [ %74, %78 ]
  %118 = phi i8* [ %101, %113 ], [ %83, %95 ], [ %66, %78 ]
  %119 = phi i32 [ %114, %113 ], [ %96, %95 ], [ %74, %78 ], !dbg !459
  call void @llvm.dbg.value(metadata i32 %119, metadata !361, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i8* %118, metadata !364, metadata !DIExpression()), !dbg !459
  %120 = icmp eq i32 %119, 0, !dbg !555
  br i1 %120, label %121, label %132, !dbg !556

121:                                              ; preds = %116
  %122 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @lb_kernel_code.____fmt.7, i64 0, i64 0), i32 noundef 49, i32 noundef 205) #5, !dbg !557
  call void @llvm.dbg.value(metadata i8* %32, metadata !369, metadata !DIExpression()), !dbg !559
  %123 = getelementptr i8, i8* %12, i64 46, !dbg !560
  %124 = icmp ugt i8* %123, %16, !dbg !562
  br i1 %124, label %257, label %125, !dbg !563

125:                                              ; preds = %121
  %126 = call i64 inttoptr (i64 87 to i64 (i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.2* @lb_queue to i8*), i8* noundef %32, i64 noundef 2) #5, !dbg !564
  call void @llvm.dbg.value(metadata i64 %126, metadata !372, metadata !DIExpression()), !dbg !559
  %127 = icmp slt i64 %126, 0, !dbg !565
  br i1 %127, label %128, label %130, !dbg !567

128:                                              ; preds = %125
  %129 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([68 x i8], [68 x i8]* @lb_kernel_code.____fmt.8, i64 0, i64 0), i32 noundef 68, i32 noundef 213) #5, !dbg !568
  br label %257, !dbg !571

130:                                              ; preds = %125
  %131 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([55 x i8], [55 x i8]* @lb_kernel_code.____fmt.9, i64 0, i64 0), i32 noundef 55, i32 noundef 216) #5, !dbg !572
  br label %257, !dbg !574

132:                                              ; preds = %116
  call void @llvm.dbg.value(metadata i8* %118, metadata !364, metadata !DIExpression()), !dbg !459
  %133 = add i32 %117, -1, !dbg !575
  %134 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([59 x i8], [59 x i8]* @lb_kernel_code.____fmt.10, i64 0, i64 0), i32 noundef 59, i32 noundef 222, i8* noundef nonnull %118, i32 noundef %133) #5, !dbg !575
  call void @llvm.dbg.value(metadata i32* %3, metadata !362, metadata !DIExpression(DW_OP_deref)), !dbg !459
  %135 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %47) #5, !dbg !577
  call void @llvm.dbg.value(metadata i8* %135, metadata !364, metadata !DIExpression()), !dbg !459
  %136 = icmp eq i8* %135, null, !dbg !578
  br i1 %136, label %137, label %140, !dbg !580

137:                                              ; preds = %132
  %138 = load i32, i32* %2, align 4, !dbg !581, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %138, metadata !358, metadata !DIExpression()), !dbg !459
  %139 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([73 x i8], [73 x i8]* @lb_kernel_code.____fmt.11, i64 0, i64 0), i32 noundef 73, i32 noundef 225, i32 noundef %138) #5, !dbg !581
  br label %257, !dbg !584

140:                                              ; preds = %132
  %141 = getelementptr inbounds i8, i8* %135, i64 4, !dbg !585
  %142 = bitcast i8* %141 to i32*, !dbg !585
  %143 = load i32, i32* %142, align 4, !dbg !586, !tbaa !501
  %144 = add i32 %143, -1, !dbg !586
  store i32 %144, i32* %142, align 4, !dbg !586, !tbaa !501
  call void @llvm.dbg.value(metadata i32* %3, metadata !362, metadata !DIExpression(DW_OP_deref)), !dbg !459
  %145 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %47, i8* noundef nonnull %135, i64 noundef 2) #5, !dbg !587
  call void @llvm.dbg.value(metadata i64 %145, metadata !373, metadata !DIExpression()), !dbg !588
  %146 = icmp slt i64 %145, 0, !dbg !589
  br i1 %146, label %147, label %150, !dbg !591

147:                                              ; preds = %140
  %148 = load i32, i32* %2, align 4, !dbg !592, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %148, metadata !358, metadata !DIExpression()), !dbg !459
  %149 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([76 x i8], [76 x i8]* @lb_kernel_code.____fmt.12, i64 0, i64 0), i32 noundef 76, i32 noundef 231, i32 noundef %148) #5, !dbg !592
  br label %257, !dbg !595

150:                                              ; preds = %140
  %151 = bitcast i8* %135 to i32*, !dbg !596
  %152 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([45 x i8], [45 x i8]* @lb_kernel_code.____fmt.13, i64 0, i64 0), i32 noundef 45, i32 noundef 235, i8* noundef nonnull %135) #5, !dbg !596
  %153 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %17, i64 0, i32 1, i64 0, !dbg !598
  %154 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %17, i64 0, i32 0, i64 0, !dbg !598
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %153, i8* noundef nonnull align 1 dereferenceable(6) %154, i64 6, i1 false), !dbg !598
  %155 = getelementptr inbounds i8, i8* %135, i64 10, !dbg !599
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %154, i8* noundef nonnull align 2 dereferenceable(6) %155, i64 6, i1 false), !dbg !600
  %156 = getelementptr i8, i8* %12, i64 26, !dbg !601
  %157 = getelementptr i8, i8* %12, i64 30, !dbg !601
  %158 = bitcast i8* %157 to i32*, !dbg !601
  %159 = load i32, i32* %158, align 4, !dbg !601, !tbaa !602
  %160 = bitcast i8* %156 to i32*, !dbg !603
  store i32 %159, i32* %160, align 4, !dbg !604, !tbaa !602
  %161 = load i32, i32* %151, align 4, !dbg !605, !tbaa !602
  store i32 %161, i32* %158, align 4, !dbg !606, !tbaa !602
  %162 = load i16, i16* %36, align 2, !dbg !607, !tbaa !447
  %163 = bitcast i8* %25 to i16*, !dbg !608
  store i16 %162, i16* %163, align 2, !dbg !609, !tbaa !610
  %164 = getelementptr inbounds i8, i8* %135, i64 8, !dbg !611
  %165 = bitcast i8* %164 to i16*, !dbg !611
  %166 = load i16, i16* %165, align 4, !dbg !611, !tbaa !612
  store i16 %166, i16* %36, align 2, !dbg !613, !tbaa !447
  %167 = getelementptr i8, i8* %12, i64 24, !dbg !614
  %168 = bitcast i8* %167 to i16*, !dbg !614
  %169 = bitcast i8* %18 to i16*, !dbg !615
  call void @llvm.dbg.value(metadata i64 0, metadata !616, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 20, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16* %169, metadata !622, metadata !DIExpression()), !dbg !624
  %170 = load i16, i16* %169, align 2, !dbg !626, !tbaa !628
  %171 = zext i16 %170 to i64, !dbg !626
  call void @llvm.dbg.value(metadata i64 %171, metadata !616, metadata !DIExpression()), !dbg !624
  %172 = getelementptr i8, i8* %12, i64 16, !dbg !629
  %173 = bitcast i8* %172 to i16*, !dbg !629
  call void @llvm.dbg.value(metadata i32 18, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16* %173, metadata !622, metadata !DIExpression()), !dbg !624
  %174 = load i16, i16* %173, align 2, !dbg !626, !tbaa !628
  %175 = zext i16 %174 to i64, !dbg !626
  %176 = add nuw nsw i64 %175, %171, !dbg !630
  call void @llvm.dbg.value(metadata i64 %176, metadata !616, metadata !DIExpression()), !dbg !624
  %177 = getelementptr i8, i8* %12, i64 18, !dbg !629
  %178 = bitcast i8* %177 to i16*, !dbg !629
  call void @llvm.dbg.value(metadata i32 16, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16* %178, metadata !622, metadata !DIExpression()), !dbg !624
  %179 = load i16, i16* %178, align 2, !dbg !626, !tbaa !628
  %180 = zext i16 %179 to i64, !dbg !626
  %181 = add nuw nsw i64 %176, %180, !dbg !630
  call void @llvm.dbg.value(metadata i64 %181, metadata !616, metadata !DIExpression()), !dbg !624
  %182 = getelementptr i8, i8* %12, i64 20, !dbg !629
  %183 = bitcast i8* %182 to i16*, !dbg !629
  call void @llvm.dbg.value(metadata i32 14, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16* %183, metadata !622, metadata !DIExpression()), !dbg !624
  %184 = load i16, i16* %183, align 2, !dbg !626, !tbaa !628
  %185 = zext i16 %184 to i64, !dbg !626
  %186 = add nuw nsw i64 %181, %185, !dbg !630
  call void @llvm.dbg.value(metadata i64 %186, metadata !616, metadata !DIExpression()), !dbg !624
  %187 = getelementptr i8, i8* %12, i64 22, !dbg !629
  %188 = bitcast i8* %187 to i16*, !dbg !629
  call void @llvm.dbg.value(metadata i32 12, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16* %188, metadata !622, metadata !DIExpression()), !dbg !624
  %189 = load i16, i16* %188, align 2, !dbg !626, !tbaa !628
  %190 = zext i16 %189 to i64, !dbg !626
  %191 = add nuw nsw i64 %186, %190, !dbg !630
  call void @llvm.dbg.value(metadata i64 %191, metadata !616, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 10, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i16* %168, metadata !622, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i64 %191, metadata !616, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 8, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i8* %156, metadata !622, metadata !DIExpression()), !dbg !624
  %192 = and i32 %159, 65535, !dbg !626
  %193 = zext i32 %192 to i64, !dbg !626
  %194 = add nuw nsw i64 %191, %193, !dbg !630
  call void @llvm.dbg.value(metadata i64 %194, metadata !616, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 6, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i8* %12, metadata !622, metadata !DIExpression(DW_OP_plus_uconst, 28, DW_OP_stack_value)), !dbg !624
  %195 = lshr i32 %159, 16, !dbg !626
  %196 = zext i32 %195 to i64, !dbg !626
  %197 = add nuw nsw i64 %194, %196, !dbg !630
  call void @llvm.dbg.value(metadata i64 %197, metadata !616, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 4, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i8* %157, metadata !622, metadata !DIExpression()), !dbg !624
  %198 = and i32 %161, 65535, !dbg !626
  %199 = zext i32 %198 to i64, !dbg !626
  %200 = add nuw nsw i64 %197, %199, !dbg !630
  call void @llvm.dbg.value(metadata i64 %200, metadata !616, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i32 2, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i8* %12, metadata !622, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !624
  %201 = lshr i32 %161, 16, !dbg !626
  %202 = zext i32 %201 to i64, !dbg !626
  %203 = add nuw nsw i64 %200, %202, !dbg !630
  call void @llvm.dbg.value(metadata i8* %12, metadata !622, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_plus_uconst, 2, DW_OP_stack_value)), !dbg !624
  call void @llvm.dbg.value(metadata i32 0, metadata !623, metadata !DIExpression()), !dbg !624
  call void @llvm.dbg.value(metadata i64 %203, metadata !616, metadata !DIExpression()), !dbg !624
  %204 = and i64 %203, 65535, !dbg !631
  %205 = lshr i64 %203, 16, !dbg !632
  %206 = add nuw nsw i64 %204, %205, !dbg !633
  call void @llvm.dbg.value(metadata i64 %206, metadata !616, metadata !DIExpression()), !dbg !624
  %207 = lshr i64 %206, 16, !dbg !634
  %208 = add nuw nsw i64 %207, %206, !dbg !635
  call void @llvm.dbg.value(metadata !DIArgList(i64 %206, i64 %207), metadata !616, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !624
  %209 = trunc i64 %208 to i16, !dbg !636
  %210 = xor i16 %209, -1, !dbg !636
  store i16 %210, i16* %168, align 2, !dbg !637, !tbaa !638
  %211 = getelementptr i8, i8* %12, i64 40, !dbg !639
  %212 = bitcast i8* %211 to i16*, !dbg !639
  store i16 0, i16* %212, align 2, !dbg !640, !tbaa !641
  call void @llvm.dbg.value(metadata i8* %18, metadata !642, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i8* %25, metadata !647, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i8* %16, metadata !648, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i16 0, metadata !649, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i16* %163, metadata !650, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i32 %159, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !653
  %213 = add i32 %195, %159, !dbg !655
  call void @llvm.dbg.value(metadata i32 %213, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !653
  %214 = add i32 %213, %161, !dbg !656
  call void @llvm.dbg.value(metadata i32 %214, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !653
  %215 = add i32 %214, %201, !dbg !657
  call void @llvm.dbg.value(metadata i32 %215, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !653
  %216 = and i16 %189, -256, !dbg !658
  call void @llvm.dbg.value(metadata !DIArgList(i32 %215, i16 %216), metadata !649, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !653
  %217 = getelementptr i8, i8* %12, i64 38, !dbg !659
  %218 = bitcast i8* %217 to i16*, !dbg !659
  %219 = load i16, i16* %218, align 2, !dbg !659, !tbaa !660
  %220 = trunc i32 %215 to i16, !dbg !661
  %221 = add i16 %216, %220, !dbg !661
  %222 = add i16 %219, %221, !dbg !661
  call void @llvm.dbg.value(metadata i16 %222, metadata !649, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i32 0, metadata !651, metadata !DIExpression()), !dbg !662
  %223 = icmp ugt i8* %35, %16
  br i1 %223, label %243, label %224, !dbg !663

224:                                              ; preds = %150
  call void @llvm.dbg.value(metadata i32 0, metadata !651, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i16* undef, metadata !650, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i16 %222, metadata !649, metadata !DIExpression()), !dbg !653
  %225 = add i16 %162, %222, !dbg !664
  call void @llvm.dbg.value(metadata i16 %225, metadata !649, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i16* %36, metadata !650, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i32 0, metadata !651, metadata !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value)), !dbg !662
  %226 = getelementptr i8, i8* %12, i64 38
  %227 = icmp ugt i8* %226, %16
  br i1 %227, label %243, label %228, !dbg !663, !llvm.loop !667

228:                                              ; preds = %224
  %229 = bitcast i8* %226 to i16*
  br label %230, !dbg !663

230:                                              ; preds = %228, %230
  %231 = phi i16* [ %229, %228 ], [ %239, %230 ]
  %232 = phi i16 [ %225, %228 ], [ %237, %230 ]
  %233 = phi i32 [ 0, %228 ], [ %235, %230 ]
  %234 = phi i16* [ %36, %228 ], [ %231, %230 ]
  call void @llvm.dbg.value(metadata i32 %233, metadata !651, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i16* %234, metadata !650, metadata !DIExpression()), !dbg !653
  %235 = add nuw nsw i32 %233, 2, !dbg !670
  call void @llvm.dbg.value(metadata i32 %235, metadata !651, metadata !DIExpression()), !dbg !662
  %236 = load i16, i16* %234, align 2, !dbg !671, !tbaa !628
  call void @llvm.dbg.value(metadata i16* undef, metadata !650, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i16 %232, metadata !649, metadata !DIExpression()), !dbg !653
  %237 = add i16 %236, %232, !dbg !664
  call void @llvm.dbg.value(metadata i16 %237, metadata !649, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i16* %231, metadata !650, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata i32 %235, metadata !651, metadata !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value)), !dbg !662
  %238 = icmp ugt i32 %233, 1475, !dbg !672
  %239 = getelementptr inbounds i16, i16* %231, i64 1
  %240 = bitcast i16* %239 to i8*
  %241 = icmp ugt i8* %240, %16
  %242 = select i1 %238, i1 true, i1 %241, !dbg !663
  br i1 %242, label %243, label %230, !dbg !663, !llvm.loop !667

243:                                              ; preds = %230, %224, %150
  %244 = phi i16 [ %222, %150 ], [ %225, %224 ], [ %237, %230 ], !dbg !653
  %245 = phi i16* [ %163, %150 ], [ %36, %224 ], [ %231, %230 ], !dbg !653
  %246 = bitcast i16* %245 to i8*, !dbg !673
  %247 = getelementptr i8, i8* %246, i64 1, !dbg !675
  %248 = icmp ugt i8* %247, %16, !dbg !676
  br i1 %248, label %253, label %249, !dbg !677

249:                                              ; preds = %243
  %250 = load i8, i8* %246, align 1, !dbg !678, !tbaa !602
  %251 = zext i8 %250 to i16, !dbg !678
  %252 = add i16 %244, %251, !dbg !680
  call void @llvm.dbg.value(metadata i16 %252, metadata !649, metadata !DIExpression()), !dbg !653
  br label %253, !dbg !681

253:                                              ; preds = %243, %249
  %254 = phi i16 [ %252, %249 ], [ %244, %243 ], !dbg !653
  call void @llvm.dbg.value(metadata i16 %254, metadata !649, metadata !DIExpression()), !dbg !653
  %255 = xor i16 %254, -1, !dbg !682
  call void @llvm.dbg.value(metadata i16 %255, metadata !649, metadata !DIExpression()), !dbg !653
  store i16 %255, i16* %212, align 2, !dbg !683, !tbaa !641
  %256 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([53 x i8], [53 x i8]* @lb_kernel_code.____fmt.14, i64 0, i64 0), i32 noundef 53, i32 noundef 248, i8* noundef nonnull %157) #5, !dbg !684
  br label %257, !dbg !686

257:                                              ; preds = %147, %253, %121, %130, %128, %54, %63, %61, %137, %103, %85, %68
  %258 = phi i32 [ 1, %68 ], [ 1, %85 ], [ 1, %103 ], [ 1, %137 ], [ 0, %54 ], [ 1, %63 ], [ 1, %61 ], [ 0, %121 ], [ 1, %130 ], [ 1, %128 ], [ 1, %147 ], [ 3, %253 ], !dbg !459
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %47) #5, !dbg !687
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %46) #5, !dbg !687
  br label %477

259:                                              ; preds = %39
  %260 = tail call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @lb_kernel_code.____fmt.15, i64 0, i64 0), i32 noundef 23, i32 noundef 253) #5, !dbg !688
  %261 = bitcast i32* %4 to i8*, !dbg !690
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %261) #5, !dbg !690
  call void @llvm.dbg.value(metadata i32 0, metadata !375, metadata !DIExpression()), !dbg !691
  store i32 0, i32* %4, align 4, !dbg !692, !tbaa !461
  %262 = bitcast i32* %5 to i8*, !dbg !690
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %262) #5, !dbg !690
  call void @llvm.dbg.value(metadata i32 0, metadata !377, metadata !DIExpression()), !dbg !691
  store i32 0, i32* %5, align 4, !dbg !693, !tbaa !461
  %263 = bitcast i32* %6 to i8*, !dbg !694
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %263) #5, !dbg !694
  %264 = getelementptr i8, i8* %12, i64 26, !dbg !695
  %265 = bitcast i8* %264 to i32*, !dbg !695
  %266 = load i32, i32* %265, align 4, !dbg !695, !tbaa !602
  call void @llvm.dbg.value(metadata i32 %266, metadata !378, metadata !DIExpression()), !dbg !691
  store i32 %266, i32* %6, align 4, !dbg !696, !tbaa !461
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %267 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.4* @lb_ip_to_index to i8*), i8* noundef nonnull %263) #5, !dbg !697
  call void @llvm.dbg.value(metadata i8* %267, metadata !379, metadata !DIExpression()), !dbg !691
  %268 = icmp eq i8* %267, null, !dbg !698
  br i1 %268, label %269, label %308, !dbg !699

269:                                              ; preds = %259
  call void @llvm.dbg.value(metadata i32* %4, metadata !375, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %270 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.1* @lb_servers_init to i8*), i8* noundef nonnull %261) #5, !dbg !700
  call void @llvm.dbg.value(metadata i8* %270, metadata !380, metadata !DIExpression()), !dbg !701
  %271 = icmp eq i8* %270, null, !dbg !702
  br i1 %271, label %275, label %272, !dbg !704

272:                                              ; preds = %269
  %273 = bitcast i8* %270 to i32*, !dbg !705
  call void @llvm.dbg.value(metadata i32* %273, metadata !380, metadata !DIExpression()), !dbg !701
  %274 = load i32, i32* %273, align 4, !dbg !706, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %274, metadata !377, metadata !DIExpression()), !dbg !691
  br label %275

275:                                              ; preds = %269, %272
  %276 = phi i32 [ %274, %272 ], [ 0, %269 ], !dbg !707
  store i32 %276, i32* %5, align 4, !dbg !707, !tbaa !461
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %277 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([50 x i8], [50 x i8]* @lb_kernel_code.____fmt.16, i64 0, i64 0), i32 noundef 50, i32 noundef 266, i32* noundef nonnull %6) #5, !dbg !708
  call void @llvm.dbg.value(metadata i32* %5, metadata !377, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %278 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.4* @lb_ip_to_index to i8*), i8* noundef nonnull %263, i8* noundef nonnull %262, i64 noundef 0) #5, !dbg !710
  call void @llvm.dbg.value(metadata i64 %278, metadata !383, metadata !DIExpression()), !dbg !701
  %279 = icmp slt i64 %278, 0, !dbg !711
  br i1 %279, label %280, label %282, !dbg !713

280:                                              ; preds = %275
  %281 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @lb_kernel_code.____fmt.17, i64 0, i64 0), i32 noundef 58, i32 noundef 269) #5, !dbg !714
  br label %475, !dbg !717

282:                                              ; preds = %275
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %283 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @lb_kernel_code.____fmt.18, i64 0, i64 0), i32 noundef 47, i32 noundef 272, i32* noundef nonnull %6) #5, !dbg !718
  %284 = bitcast %struct.backend_info* %7 to i8*, !dbg !720
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %284) #5, !dbg !720
  call void @llvm.dbg.declare(metadata %struct.backend_info* %7, metadata !384, metadata !DIExpression()), !dbg !721
  %285 = getelementptr inbounds %struct.backend_info, %struct.backend_info* %7, i64 0, i32 1, !dbg !722
  store i32 5, i32* %285, align 4, !dbg !723, !tbaa !501
  %286 = load i32, i32* %265, align 4, !dbg !724, !tbaa !602
  %287 = getelementptr inbounds %struct.backend_info, %struct.backend_info* %7, i64 0, i32 0, !dbg !725
  store i32 %286, i32* %287, align 4, !dbg !726, !tbaa !727
  %288 = bitcast i8* %25 to i16*, !dbg !728
  %289 = load i16, i16* %288, align 2, !dbg !728, !tbaa !610
  %290 = getelementptr inbounds %struct.backend_info, %struct.backend_info* %7, i64 0, i32 2, !dbg !729
  store i16 %289, i16* %290, align 4, !dbg !730, !tbaa !612
  %291 = getelementptr inbounds %struct.backend_info, %struct.backend_info* %7, i64 0, i32 3, i64 0, !dbg !731
  %292 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %17, i64 0, i32 1, i64 0, !dbg !731
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %291, i8* noundef nonnull align 1 dereferenceable(6) %292, i64 6, i1 false), !dbg !731
  call void @llvm.dbg.value(metadata i32* %5, metadata !377, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %293 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %262, i8* noundef nonnull %284, i64 noundef 0) #5, !dbg !732
  call void @llvm.dbg.value(metadata i64 %293, metadata !383, metadata !DIExpression()), !dbg !701
  %294 = icmp slt i64 %293, 0, !dbg !733
  br i1 %294, label %295, label %297, !dbg !735

295:                                              ; preds = %282
  %296 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @lb_kernel_code.____fmt.19, i64 0, i64 0), i32 noundef 54, i32 noundef 282) #5, !dbg !736
  br label %307, !dbg !739

297:                                              ; preds = %282
  %298 = load i32, i32* %5, align 4, !dbg !740, !tbaa !461
  call void @llvm.dbg.value(metadata i32 %298, metadata !377, metadata !DIExpression()), !dbg !691
  %299 = add i32 %298, 1, !dbg !740
  call void @llvm.dbg.value(metadata i32 %299, metadata !377, metadata !DIExpression()), !dbg !691
  store i32 %299, i32* %5, align 4, !dbg !740, !tbaa !461
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %300 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([51 x i8], [51 x i8]* @lb_kernel_code.____fmt.20, i64 0, i64 0), i32 noundef 51, i32 noundef 287, i32* noundef nonnull %6) #5, !dbg !741
  call void @llvm.dbg.value(metadata i32* %4, metadata !375, metadata !DIExpression(DW_OP_deref)), !dbg !691
  call void @llvm.dbg.value(metadata i32* %5, metadata !377, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %301 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.1* @lb_servers_init to i8*), i8* noundef nonnull %261, i8* noundef nonnull %262, i64 noundef 0) #5, !dbg !743
  call void @llvm.dbg.value(metadata i64 %301, metadata !383, metadata !DIExpression()), !dbg !701
  %302 = icmp slt i64 %301, 0, !dbg !744
  br i1 %302, label %303, label %305, !dbg !746

303:                                              ; preds = %297
  %304 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @lb_kernel_code.____fmt.21, i64 0, i64 0), i32 noundef 58, i32 noundef 290) #5, !dbg !747
  br label %307, !dbg !750

305:                                              ; preds = %297
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %306 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @lb_kernel_code.____fmt.22, i64 0, i64 0), i32 noundef 38, i32 noundef 293, i32* noundef nonnull %6) #5, !dbg !751
  br label %307, !dbg !753

307:                                              ; preds = %305, %303, %295
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %284) #5, !dbg !754
  br label %475

308:                                              ; preds = %259
  %309 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %267) #5, !dbg !755
  call void @llvm.dbg.value(metadata i8* %309, metadata !385, metadata !DIExpression()), !dbg !691
  %310 = icmp eq i8* %309, null, !dbg !756
  br i1 %310, label %311, label %313, !dbg !757

311:                                              ; preds = %308
  %312 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([57 x i8], [57 x i8]* @lb_kernel_code.____fmt.23, i64 0, i64 0), i32 noundef 57, i32 noundef 300) #5, !dbg !758
  br label %475, !dbg !761

313:                                              ; preds = %308
  %314 = bitcast i32* %8 to i8*, !dbg !762
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %314) #5, !dbg !762
  call void @llvm.dbg.value(metadata i32* %8, metadata !386, metadata !DIExpression(DW_OP_deref)), !dbg !763
  %315 = call i64 inttoptr (i64 88 to i64 (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.2* @lb_queue to i8*), i8* noundef nonnull %314) #5, !dbg !764
  call void @llvm.dbg.value(metadata i64 %315, metadata !389, metadata !DIExpression()), !dbg !763
  %316 = icmp slt i64 %315, 0, !dbg !765
  br i1 %316, label %317, label %332, !dbg !766

317:                                              ; preds = %313
  %318 = getelementptr inbounds i8, i8* %309, i64 4, !dbg !767
  %319 = bitcast i8* %318 to i32*, !dbg !767
  %320 = load i32, i32* %319, align 4, !dbg !767, !tbaa !501
  %321 = icmp ult i32 %320, 5, !dbg !769
  br i1 %321, label %322, label %325, !dbg !770

322:                                              ; preds = %317
  %323 = add nuw nsw i32 %320, 1, !dbg !771
  store i32 %323, i32* %319, align 4, !dbg !771, !tbaa !501
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %324 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([44 x i8], [44 x i8]* @lb_kernel_code.____fmt.24, i64 0, i64 0), i32 noundef 44, i32 noundef 311, i32* noundef nonnull %6, i32 noundef %323) #5, !dbg !773
  br label %327, !dbg !775

325:                                              ; preds = %317
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %326 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @lb_kernel_code.____fmt.25, i64 0, i64 0), i32 noundef 52, i32 noundef 314, i32* noundef nonnull %6, i32 noundef %320) #5, !dbg !776
  br label %327

327:                                              ; preds = %325, %322
  %328 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* noundef bitcast (%struct.anon.3* @lb_capacity to i8*), i8* noundef nonnull %267, i8* noundef nonnull %309, i64 noundef 2) #5, !dbg !779
  call void @llvm.dbg.value(metadata i64 %328, metadata !390, metadata !DIExpression()), !dbg !780
  %329 = icmp slt i64 %328, 0, !dbg !781
  br i1 %329, label %330, label %473, !dbg !783

330:                                              ; preds = %327
  %331 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @lb_kernel_code.____fmt.26, i64 0, i64 0), i32 noundef 48, i32 noundef 319) #5, !dbg !784
  br label %473, !dbg !787

332:                                              ; preds = %313
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %333 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([51 x i8], [51 x i8]* @lb_kernel_code.____fmt.27, i64 0, i64 0), i32 noundef 51, i32 noundef 326, i32* noundef nonnull %6) #5, !dbg !788
  %334 = call i64 inttoptr (i64 65 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef 3) #5, !dbg !790
  call void @llvm.dbg.value(metadata i64 %334, metadata !393, metadata !DIExpression()), !dbg !791
  %335 = icmp slt i64 %334, 0, !dbg !792
  br i1 %335, label %336, label %338, !dbg !794

336:                                              ; preds = %332
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %337 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([80 x i8], [80 x i8]* @lb_kernel_code.____fmt.28, i64 0, i64 0), i32 noundef 80, i32 noundef 329, i32* noundef nonnull %6) #5, !dbg !795
  br label %473, !dbg !798

338:                                              ; preds = %332
  %339 = load i32, i32* %9, align 4, !dbg !799, !tbaa !409
  %340 = zext i32 %339 to i64, !dbg !800
  %341 = inttoptr i64 %340 to i8*, !dbg !801
  call void @llvm.dbg.value(metadata i8* %341, metadata !395, metadata !DIExpression()), !dbg !791
  %342 = load i32, i32* %13, align 4, !dbg !802, !tbaa !417
  %343 = zext i32 %342 to i64, !dbg !803
  %344 = inttoptr i64 %343 to i8*, !dbg !804
  call void @llvm.dbg.value(metadata i8* %344, metadata !396, metadata !DIExpression()), !dbg !791
  %345 = inttoptr i64 %340 to %struct.ethhdr*, !dbg !805
  call void @llvm.dbg.value(metadata %struct.ethhdr* %345, metadata !397, metadata !DIExpression()), !dbg !791
  %346 = getelementptr i8, i8* %341, i64 14, !dbg !806
  %347 = icmp ugt i8* %346, %344, !dbg !808
  br i1 %347, label %473, label %348, !dbg !809

348:                                              ; preds = %338
  call void @llvm.dbg.value(metadata i8* %346, metadata !398, metadata !DIExpression()), !dbg !791
  %349 = getelementptr i8, i8* %341, i64 34, !dbg !810
  %350 = icmp ugt i8* %349, %344, !dbg !812
  br i1 %350, label %473, label %351, !dbg !813

351:                                              ; preds = %348
  call void @llvm.dbg.value(metadata i8* %349, metadata !399, metadata !DIExpression()), !dbg !791
  %352 = getelementptr i8, i8* %341, i64 42, !dbg !814
  %353 = icmp ugt i8* %352, %344, !dbg !816
  br i1 %353, label %473, label %354, !dbg !817

354:                                              ; preds = %351
  %355 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %345, i64 0, i32 1, i64 0, !dbg !818
  %356 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %345, i64 0, i32 0, i64 0, !dbg !818
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %355, i8* noundef nonnull align 1 dereferenceable(6) %356, i64 6, i1 false), !dbg !818
  %357 = getelementptr inbounds i8, i8* %309, i64 10, !dbg !819
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %356, i8* noundef nonnull align 2 dereferenceable(6) %357, i64 6, i1 false), !dbg !820
  %358 = getelementptr i8, i8* %341, i64 26, !dbg !821
  %359 = getelementptr i8, i8* %341, i64 30, !dbg !821
  %360 = bitcast i8* %359 to i32*, !dbg !821
  %361 = load i32, i32* %360, align 4, !dbg !821, !tbaa !602
  %362 = bitcast i8* %358 to i32*, !dbg !822
  store i32 %361, i32* %362, align 4, !dbg !823, !tbaa !602
  %363 = bitcast i8* %309 to i32*, !dbg !824
  %364 = load i32, i32* %363, align 4, !dbg !824, !tbaa !727
  store i32 %364, i32* %360, align 4, !dbg !825, !tbaa !602
  %365 = getelementptr i8, i8* %341, i64 24, !dbg !826
  %366 = bitcast i8* %365 to i16*, !dbg !826
  store i16 0, i16* %366, align 2, !dbg !827, !tbaa !638
  %367 = getelementptr i8, i8* %341, i64 40, !dbg !828
  %368 = bitcast i8* %367 to i16*, !dbg !828
  store i16 0, i16* %368, align 2, !dbg !829, !tbaa !641
  %369 = lshr i32 %361, 16, !dbg !830
  %370 = zext i32 %369 to i64, !dbg !830
  %371 = lshr i32 %364, 16, !dbg !830
  %372 = zext i32 %371 to i64, !dbg !830
  %373 = ptrtoint i8* %346 to i64, !dbg !830
  %374 = sub nsw i64 %343, %373, !dbg !830
  %375 = trunc i64 %374 to i16, !dbg !830
  %376 = call i16 @llvm.bswap.i16(i16 %375), !dbg !830
  %377 = getelementptr i8, i8* %341, i64 16, !dbg !831
  %378 = bitcast i8* %377 to i16*, !dbg !831
  store i16 %376, i16* %378, align 2, !dbg !832, !tbaa !833
  %379 = ptrtoint i8* %349 to i64, !dbg !834
  %380 = sub nsw i64 %343, %379, !dbg !834
  %381 = trunc i64 %380 to i16, !dbg !834
  %382 = call i16 @llvm.bswap.i16(i16 %381), !dbg !834
  %383 = getelementptr i8, i8* %341, i64 38, !dbg !835
  %384 = bitcast i8* %383 to i16*, !dbg !835
  store i16 %382, i16* %384, align 2, !dbg !836, !tbaa !660
  %385 = getelementptr i8, i8* %341, i64 36, !dbg !837
  %386 = bitcast i8* %385 to i16*, !dbg !837
  %387 = load i16, i16* %386, align 2, !dbg !837, !tbaa !447
  %388 = bitcast i8* %349 to i16*, !dbg !838
  store i16 %387, i16* %388, align 2, !dbg !839, !tbaa !610
  %389 = getelementptr inbounds i8, i8* %309, i64 8, !dbg !840
  %390 = bitcast i8* %389 to i16*, !dbg !840
  %391 = load i16, i16* %390, align 4, !dbg !840, !tbaa !612
  store i16 %391, i16* %386, align 2, !dbg !841, !tbaa !447
  %392 = bitcast i8* %346 to i16*, !dbg !842
  call void @llvm.dbg.value(metadata i64 0, metadata !616, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i32 20, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i16* %392, metadata !622, metadata !DIExpression()), !dbg !843
  %393 = load i16, i16* %392, align 2, !dbg !845, !tbaa !628
  %394 = zext i16 %393 to i64, !dbg !845
  call void @llvm.dbg.value(metadata i64 %394, metadata !616, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i32 18, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i16* %378, metadata !622, metadata !DIExpression()), !dbg !843
  %395 = zext i16 %376 to i64, !dbg !845
  %396 = add nuw nsw i64 %395, %394, !dbg !846
  call void @llvm.dbg.value(metadata i64 %396, metadata !616, metadata !DIExpression()), !dbg !843
  %397 = getelementptr i8, i8* %341, i64 18, !dbg !847
  %398 = bitcast i8* %397 to i16*, !dbg !847
  call void @llvm.dbg.value(metadata i32 16, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i16* %398, metadata !622, metadata !DIExpression()), !dbg !843
  %399 = load i16, i16* %398, align 2, !dbg !845, !tbaa !628
  %400 = zext i16 %399 to i64, !dbg !845
  %401 = add nuw nsw i64 %396, %400, !dbg !846
  call void @llvm.dbg.value(metadata i64 %401, metadata !616, metadata !DIExpression()), !dbg !843
  %402 = getelementptr i8, i8* %341, i64 20, !dbg !847
  %403 = bitcast i8* %402 to i16*, !dbg !847
  call void @llvm.dbg.value(metadata i32 14, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i16* %403, metadata !622, metadata !DIExpression()), !dbg !843
  %404 = load i16, i16* %403, align 2, !dbg !845, !tbaa !628
  %405 = zext i16 %404 to i64, !dbg !845
  %406 = add nuw nsw i64 %401, %405, !dbg !846
  call void @llvm.dbg.value(metadata i64 %406, metadata !616, metadata !DIExpression()), !dbg !843
  %407 = getelementptr i8, i8* %341, i64 22, !dbg !847
  %408 = bitcast i8* %407 to i16*, !dbg !847
  call void @llvm.dbg.value(metadata i32 12, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i16* %408, metadata !622, metadata !DIExpression()), !dbg !843
  %409 = load i16, i16* %408, align 2, !dbg !845, !tbaa !628
  %410 = zext i16 %409 to i64, !dbg !845
  %411 = add nuw nsw i64 %406, %410, !dbg !846
  call void @llvm.dbg.value(metadata i64 %411, metadata !616, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i32 10, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i16* %366, metadata !622, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i64 %411, metadata !616, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i32 8, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i8* %358, metadata !622, metadata !DIExpression()), !dbg !843
  %412 = and i32 %361, 65535, !dbg !845
  %413 = zext i32 %412 to i64, !dbg !845
  %414 = add nuw nsw i64 %411, %413, !dbg !846
  call void @llvm.dbg.value(metadata i64 %414, metadata !616, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i32 6, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i8* %341, metadata !622, metadata !DIExpression(DW_OP_plus_uconst, 28, DW_OP_stack_value)), !dbg !843
  %415 = add nuw nsw i64 %414, %370, !dbg !846
  call void @llvm.dbg.value(metadata i64 %415, metadata !616, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i32 4, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i8* %359, metadata !622, metadata !DIExpression()), !dbg !843
  %416 = and i32 %364, 65535, !dbg !845
  %417 = zext i32 %416 to i64, !dbg !845
  %418 = add nuw nsw i64 %415, %417, !dbg !846
  call void @llvm.dbg.value(metadata i64 %418, metadata !616, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i32 2, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i8* %341, metadata !622, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_stack_value)), !dbg !843
  %419 = add nuw nsw i64 %418, %372, !dbg !846
  call void @llvm.dbg.value(metadata i8* %341, metadata !622, metadata !DIExpression(DW_OP_plus_uconst, 32, DW_OP_plus_uconst, 2, DW_OP_stack_value)), !dbg !843
  call void @llvm.dbg.value(metadata i32 0, metadata !623, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.value(metadata i64 %419, metadata !616, metadata !DIExpression()), !dbg !843
  %420 = and i64 %419, 65535, !dbg !848
  %421 = lshr i64 %419, 16, !dbg !849
  %422 = add nuw nsw i64 %420, %421, !dbg !850
  call void @llvm.dbg.value(metadata i64 %422, metadata !616, metadata !DIExpression()), !dbg !843
  %423 = lshr i64 %422, 16, !dbg !851
  %424 = add nuw nsw i64 %423, %422, !dbg !852
  call void @llvm.dbg.value(metadata !DIArgList(i64 %422, i64 %423), metadata !616, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !843
  %425 = trunc i64 %424 to i16, !dbg !853
  %426 = xor i16 %425, -1, !dbg !853
  store i16 %426, i16* %366, align 2, !dbg !854, !tbaa !638
  call void @llvm.dbg.value(metadata i8* %346, metadata !642, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i8* %349, metadata !647, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i8* %344, metadata !648, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i16 0, metadata !649, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i16* %388, metadata !650, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i32 %361, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !855
  %427 = add i32 %369, %361, !dbg !857
  call void @llvm.dbg.value(metadata i32 %427, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !855
  %428 = add i32 %427, %364, !dbg !858
  call void @llvm.dbg.value(metadata i32 %428, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !855
  %429 = add i32 %428, %371, !dbg !859
  call void @llvm.dbg.value(metadata i32 %429, metadata !649, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !855
  %430 = and i16 %409, -256, !dbg !860
  call void @llvm.dbg.value(metadata !DIArgList(i32 %429, i16 %430), metadata !649, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !855
  %431 = trunc i32 %429 to i16, !dbg !861
  %432 = add i16 %430, %431, !dbg !861
  %433 = add i16 %382, %432, !dbg !861
  call void @llvm.dbg.value(metadata i16 %433, metadata !649, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i32 0, metadata !651, metadata !DIExpression()), !dbg !862
  %434 = icmp ugt i8* %385, %344
  br i1 %434, label %454, label %435, !dbg !863

435:                                              ; preds = %354
  call void @llvm.dbg.value(metadata i32 0, metadata !651, metadata !DIExpression()), !dbg !862
  call void @llvm.dbg.value(metadata i16* undef, metadata !650, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i16 %433, metadata !649, metadata !DIExpression()), !dbg !855
  %436 = add i16 %387, %433, !dbg !864
  call void @llvm.dbg.value(metadata i16 %436, metadata !649, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i16* %386, metadata !650, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i32 0, metadata !651, metadata !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value)), !dbg !862
  %437 = getelementptr i8, i8* %341, i64 38
  %438 = icmp ugt i8* %437, %344
  br i1 %438, label %454, label %439, !dbg !863, !llvm.loop !865

439:                                              ; preds = %435
  %440 = bitcast i8* %437 to i16*
  br label %441, !dbg !863

441:                                              ; preds = %439, %441
  %442 = phi i16* [ %440, %439 ], [ %450, %441 ]
  %443 = phi i16 [ %436, %439 ], [ %448, %441 ]
  %444 = phi i32 [ 0, %439 ], [ %446, %441 ]
  %445 = phi i16* [ %386, %439 ], [ %442, %441 ]
  call void @llvm.dbg.value(metadata i32 %444, metadata !651, metadata !DIExpression()), !dbg !862
  call void @llvm.dbg.value(metadata i16* %445, metadata !650, metadata !DIExpression()), !dbg !855
  %446 = add nuw nsw i32 %444, 2, !dbg !867
  call void @llvm.dbg.value(metadata i32 %446, metadata !651, metadata !DIExpression()), !dbg !862
  %447 = load i16, i16* %445, align 2, !dbg !868, !tbaa !628
  call void @llvm.dbg.value(metadata i16* undef, metadata !650, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i16 %443, metadata !649, metadata !DIExpression()), !dbg !855
  %448 = add i16 %447, %443, !dbg !864
  call void @llvm.dbg.value(metadata i16 %448, metadata !649, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i16* %442, metadata !650, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata i32 %446, metadata !651, metadata !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value)), !dbg !862
  %449 = icmp ugt i32 %444, 1475, !dbg !869
  %450 = getelementptr inbounds i16, i16* %442, i64 1
  %451 = bitcast i16* %450 to i8*
  %452 = icmp ugt i8* %451, %344
  %453 = select i1 %449, i1 true, i1 %452, !dbg !863
  br i1 %453, label %454, label %441, !dbg !863, !llvm.loop !865

454:                                              ; preds = %441, %435, %354
  %455 = phi i16 [ %433, %354 ], [ %436, %435 ], [ %448, %441 ], !dbg !855
  %456 = phi i16* [ %388, %354 ], [ %386, %435 ], [ %442, %441 ], !dbg !855
  %457 = bitcast i16* %456 to i8*, !dbg !870
  %458 = getelementptr i8, i8* %457, i64 1, !dbg !871
  %459 = icmp ugt i8* %458, %344, !dbg !872
  br i1 %459, label %464, label %460, !dbg !873

460:                                              ; preds = %454
  %461 = load i8, i8* %457, align 1, !dbg !874, !tbaa !602
  %462 = zext i8 %461 to i16, !dbg !874
  %463 = add i16 %455, %462, !dbg !875
  call void @llvm.dbg.value(metadata i16 %463, metadata !649, metadata !DIExpression()), !dbg !855
  br label %464, !dbg !876

464:                                              ; preds = %454, %460
  %465 = phi i16 [ %463, %460 ], [ %455, %454 ], !dbg !855
  call void @llvm.dbg.value(metadata i16 %465, metadata !649, metadata !DIExpression()), !dbg !855
  %466 = xor i16 %465, -1, !dbg !877
  call void @llvm.dbg.value(metadata i16 %466, metadata !649, metadata !DIExpression()), !dbg !855
  store i16 %466, i16* %368, align 2, !dbg !878, !tbaa !641
  call void @llvm.dbg.value(metadata i8* %352, metadata !400, metadata !DIExpression()), !dbg !791
  %467 = getelementptr i8, i8* %341, i64 46, !dbg !879
  %468 = icmp ugt i8* %467, %344, !dbg !881
  br i1 %468, label %473, label %469, !dbg !882

469:                                              ; preds = %464
  call void @llvm.dbg.value(metadata i32* %8, metadata !386, metadata !DIExpression(DW_OP_deref)), !dbg !763
  %470 = bitcast i8* %352 to i32*, !dbg !883
  %471 = load i32, i32* %8, align 4, !dbg !883
  store i32 %471, i32* %470, align 1, !dbg !883
  call void @llvm.dbg.value(metadata i32* %6, metadata !378, metadata !DIExpression(DW_OP_deref)), !dbg !691
  %472 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @lb_kernel_code.____fmt.29, i64 0, i64 0), i32 noundef 54, i32 noundef 379, i32* noundef nonnull %6) #5, !dbg !884
  br label %473, !dbg !886

473:                                              ; preds = %336, %348, %469, %464, %351, %338, %330, %327
  %474 = phi i32 [ 1, %327 ], [ 1, %330 ], [ 1, %336 ], [ 0, %338 ], [ 0, %348 ], [ 0, %351 ], [ 3, %469 ], [ 0, %464 ], !dbg !887
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %314) #5, !dbg !888
  br label %475

475:                                              ; preds = %311, %473, %280, %307
  %476 = phi i32 [ 1, %307 ], [ 1, %280 ], [ 1, %311 ], [ %474, %473 ], !dbg !691
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %263) #5, !dbg !889
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %262) #5, !dbg !889
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %261) #5, !dbg !889
  br label %477

477:                                              ; preds = %24, %27, %34, %475, %257, %31, %20, %1
  %478 = phi i32 [ 0, %1 ], [ 2, %20 ], [ 0, %24 ], [ 2, %27 ], [ 0, %31 ], [ 2, %34 ], [ %258, %257 ], [ %476, %475 ], !dbg !407
  ret i32 %478, !dbg !890
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!402, !403, !404, !405}
!llvm.ident = !{!406}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 144, type: !401, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "lb_kernel_code", scope: !3, file: !3, line: 117, type: !4, scopeLine: 117, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !303)
!3 = !DIFile(filename: "lb_kern.c", directory: "/lb", checksumkind: CSK_MD5, checksum: "1f05db4deeaec8c4668b2654116ef482")
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
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !66, globals: !89, splitDebugInlining: false, nameTableKind: None)
!21 = !{!22, !29, !60}
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
!60 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !9, line: 1168, baseType: !14, size: 32, elements: !61)
!61 = !{!62, !63, !64, !65}
!62 = !DIEnumerator(name: "BPF_ANY", value: 0)
!63 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!64 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!65 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!66 = !{!67, !68, !71, !73, !74, !86, !87, !88}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !69, line: 46, baseType: !70)
!69 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!70 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !13, line: 24, baseType: !72)
!72 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "backend_info", file: !3, line: 23, size: 128, elements: !76)
!76 = !{!77, !78, !79, !80}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !75, file: !3, line: 24, baseType: !12, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "capacity", scope: !75, file: !3, line: 25, baseType: !12, size: 32, offset: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !75, file: !3, line: 26, baseType: !71, size: 16, offset: 64)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !75, file: !3, line: 27, baseType: !81, size: 48, offset: 80)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !82, size: 48, elements: !84)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !13, line: 21, baseType: !83)
!83 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!84 = !{!85}
!85 = !DISubrange(count: 6)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!89 = !{!0, !90, !97, !102, !107, !112, !114, !116, !121, !123, !125, !130, !132, !137, !142, !147, !152, !157, !162, !167, !172, !174, !176, !181, !186, !191, !196, !201, !203, !208, !210, !215, !231, !243, !251, !266, !274, !281, !288, !293, !298}
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 151, type: !92, isLocal: true, isDefinition: true)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 408, elements: !95)
!93 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !94)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !{!96}
!96 = !DISubrange(count: 51)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 158, type: !99, isLocal: true, isDefinition: true)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 544, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 68)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 161, type: !104, isLocal: true, isDefinition: true)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 440, elements: !105)
!105 = !{!106}
!106 = !DISubrange(count: 55)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 168, type: !109, isLocal: true, isDefinition: true)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 584, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 73)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 181, type: !109, isLocal: true, isDefinition: true)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 194, type: !109, isLocal: true, isDefinition: true)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 205, type: !118, isLocal: true, isDefinition: true)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 392, elements: !119)
!119 = !{!120}
!120 = !DISubrange(count: 49)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 213, type: !99, isLocal: true, isDefinition: true)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 216, type: !104, isLocal: true, isDefinition: true)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 222, type: !127, isLocal: true, isDefinition: true)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 472, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 59)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 225, type: !109, isLocal: true, isDefinition: true)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 231, type: !134, isLocal: true, isDefinition: true)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 608, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 76)
!137 = !DIGlobalVariableExpression(var: !138, expr: !DIExpression())
!138 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 235, type: !139, isLocal: true, isDefinition: true)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 360, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 45)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 248, type: !144, isLocal: true, isDefinition: true)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 424, elements: !145)
!145 = !{!146}
!146 = !DISubrange(count: 53)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 253, type: !149, isLocal: true, isDefinition: true)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 184, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 23)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 266, type: !154, isLocal: true, isDefinition: true)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 400, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 50)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 269, type: !159, isLocal: true, isDefinition: true)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 464, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 58)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 272, type: !164, isLocal: true, isDefinition: true)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 376, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 47)
!167 = !DIGlobalVariableExpression(var: !168, expr: !DIExpression())
!168 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 282, type: !169, isLocal: true, isDefinition: true)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 432, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 54)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 287, type: !92, isLocal: true, isDefinition: true)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 290, type: !159, isLocal: true, isDefinition: true)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 293, type: !178, isLocal: true, isDefinition: true)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 304, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 38)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 300, type: !183, isLocal: true, isDefinition: true)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 456, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 57)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 311, type: !188, isLocal: true, isDefinition: true)
!188 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 352, elements: !189)
!189 = !{!190}
!190 = !DISubrange(count: 44)
!191 = !DIGlobalVariableExpression(var: !192, expr: !DIExpression())
!192 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 314, type: !193, isLocal: true, isDefinition: true)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 416, elements: !194)
!194 = !{!195}
!195 = !DISubrange(count: 52)
!196 = !DIGlobalVariableExpression(var: !197, expr: !DIExpression())
!197 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 319, type: !198, isLocal: true, isDefinition: true)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 384, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 48)
!201 = !DIGlobalVariableExpression(var: !202, expr: !DIExpression())
!202 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 326, type: !92, isLocal: true, isDefinition: true)
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression())
!204 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 329, type: !205, isLocal: true, isDefinition: true)
!205 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 640, elements: !206)
!206 = !{!207}
!207 = !DISubrange(count: 80)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 379, type: !169, isLocal: true, isDefinition: true)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(name: "LICENSE", scope: !20, file: !3, line: 390, type: !212, isLocal: false, isDefinition: true)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !94, size: 32, elements: !213)
!213 = !{!214}
!214 = !DISubrange(count: 4)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(name: "lb_servers_init", scope: !20, file: !3, line: 44, type: !217, isLocal: false, isDefinition: true)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 39, size: 256, elements: !218)
!218 = !{!219, !224, !225, !226}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !217, file: !3, line: 40, baseType: !220, size: 64)
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !221, size: 64)
!221 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 64, elements: !222)
!222 = !{!223}
!223 = !DISubrange(count: 2)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !217, file: !3, line: 41, baseType: !73, size: 64, offset: 64)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !217, file: !3, line: 42, baseType: !73, size: 64, offset: 128)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !217, file: !3, line: 43, baseType: !227, size: 64, offset: 192)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !229)
!229 = !{!230}
!230 = !DISubrange(count: 1)
!231 = !DIGlobalVariableExpression(var: !232, expr: !DIExpression())
!232 = distinct !DIGlobalVariable(name: "lb_capacity", scope: !20, file: !3, line: 52, type: !233, isLocal: false, isDefinition: true)
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 47, size: 256, elements: !234)
!234 = !{!235, !236, !237, !238}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !233, file: !3, line: 48, baseType: !220, size: 64)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !233, file: !3, line: 49, baseType: !73, size: 64, offset: 64)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !233, file: !3, line: 50, baseType: !74, size: 64, offset: 128)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !233, file: !3, line: 51, baseType: !239, size: 64, offset: 192)
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!240 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 96, elements: !241)
!241 = !{!242}
!242 = !DISubrange(count: 3)
!243 = !DIGlobalVariableExpression(var: !244, expr: !DIExpression())
!244 = distinct !DIGlobalVariable(name: "lb_ip_to_index", scope: !20, file: !3, line: 60, type: !245, isLocal: false, isDefinition: true)
!245 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 55, size: 256, elements: !246)
!246 = !{!247, !248, !249, !250}
!247 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !245, file: !3, line: 56, baseType: !227, size: 64)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !245, file: !3, line: 57, baseType: !73, size: 64, offset: 64)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !245, file: !3, line: 58, baseType: !73, size: 64, offset: 128)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !245, file: !3, line: 59, baseType: !239, size: 64, offset: 192)
!251 = !DIGlobalVariableExpression(var: !252, expr: !DIExpression())
!252 = distinct !DIGlobalVariable(name: "lb_queue", scope: !20, file: !3, line: 67, type: !253, isLocal: false, isDefinition: true)
!253 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 63, size: 192, elements: !254)
!254 = !{!255, !260, !261}
!255 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !253, file: !3, line: 64, baseType: !256, size: 64)
!256 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!257 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 704, elements: !258)
!258 = !{!259}
!259 = !DISubrange(count: 22)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !253, file: !3, line: 65, baseType: !73, size: 64, offset: 64)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !253, file: !3, line: 66, baseType: !262, size: 64, offset: 128)
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !263, size: 64)
!263 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32768, elements: !264)
!264 = !{!265}
!265 = !DISubrange(count: 1024)
!266 = !DIGlobalVariableExpression(var: !267, expr: !DIExpression())
!267 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !20, file: !268, line: 177, type: !269, isLocal: true, isDefinition: true)
!268 = !DIFile(filename: "libbpf/src/bpf_helper_defs.h", directory: "/lb", checksumkind: CSK_MD5, checksum: "5260f06f90b94eed43b746c45e4828c2")
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DISubroutineType(types: !271)
!271 = !{!272, !273, !12, null}
!272 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!273 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!274 = !DIGlobalVariableExpression(var: !275, expr: !DIExpression())
!275 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !20, file: !268, line: 56, type: !276, isLocal: true, isDefinition: true)
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!277 = !DISubroutineType(types: !278)
!278 = !{!67, !67, !279}
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64)
!280 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!281 = !DIGlobalVariableExpression(var: !282, expr: !DIExpression())
!282 = distinct !DIGlobalVariable(name: "bpf_map_push_elem", scope: !20, file: !268, line: 2289, type: !283, isLocal: true, isDefinition: true)
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !284, size: 64)
!284 = !DISubroutineType(types: !285)
!285 = !{!272, !67, !279, !286}
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !13, line: 31, baseType: !287)
!287 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!288 = !DIGlobalVariableExpression(var: !289, expr: !DIExpression())
!289 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !20, file: !268, line: 78, type: !290, isLocal: true, isDefinition: true)
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!291 = !DISubroutineType(types: !292)
!292 = !{!272, !67, !279, !279, !286}
!293 = !DIGlobalVariableExpression(var: !294, expr: !DIExpression())
!294 = distinct !DIGlobalVariable(name: "bpf_map_pop_elem", scope: !20, file: !268, line: 2299, type: !295, isLocal: true, isDefinition: true)
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !296, size: 64)
!296 = !DISubroutineType(types: !297)
!297 = !{!272, !67, !67}
!298 = !DIGlobalVariableExpression(var: !299, expr: !DIExpression())
!299 = distinct !DIGlobalVariable(name: "bpf_xdp_adjust_tail", scope: !20, file: !268, line: 1722, type: !300, isLocal: true, isDefinition: true)
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64)
!301 = !DISubroutineType(types: !302)
!302 = !{!272, !7, !6}
!303 = !{!304, !305, !306, !307, !318, !347, !356, !357, !358, !361, !362, !363, !364, !365, !368, !369, !372, !373, !375, !377, !378, !379, !380, !383, !384, !385, !386, !389, !390, !393, !395, !396, !397, !398, !399, !400}
!304 = !DILocalVariable(name: "info", arg: 1, scope: !2, file: !3, line: 117, type: !7)
!305 = !DILocalVariable(name: "begin", scope: !2, file: !3, line: 118, type: !67)
!306 = !DILocalVariable(name: "end", scope: !2, file: !3, line: 119, type: !67)
!307 = !DILocalVariable(name: "eth", scope: !2, file: !3, line: 120, type: !308)
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!309 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !310, line: 168, size: 112, elements: !311)
!310 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!311 = !{!312, !314, !315}
!312 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !309, file: !310, line: 169, baseType: !313, size: 48)
!313 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 48, elements: !84)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !309, file: !310, line: 170, baseType: !313, size: 48, offset: 48)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !309, file: !310, line: 171, baseType: !316, size: 16, offset: 96)
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !317, line: 25, baseType: !71)
!317 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!318 = !DILocalVariable(name: "iph", scope: !2, file: !3, line: 127, type: !319)
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !321, line: 87, size: 160, elements: !322)
!321 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!322 = !{!323, !324, !325, !326, !327, !328, !329, !330, !331, !333}
!323 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !320, file: !321, line: 89, baseType: !82, size: 4, flags: DIFlagBitField, extraData: i64 0)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !320, file: !321, line: 90, baseType: !82, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !320, file: !321, line: 97, baseType: !82, size: 8, offset: 8)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !320, file: !321, line: 98, baseType: !316, size: 16, offset: 16)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !320, file: !321, line: 99, baseType: !316, size: 16, offset: 32)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !320, file: !321, line: 100, baseType: !316, size: 16, offset: 48)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !320, file: !321, line: 101, baseType: !82, size: 8, offset: 64)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !320, file: !321, line: 102, baseType: !82, size: 8, offset: 72)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !320, file: !321, line: 103, baseType: !332, size: 16, offset: 80)
!332 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !317, line: 31, baseType: !71)
!333 = !DIDerivedType(tag: DW_TAG_member, scope: !320, file: !321, line: 104, baseType: !334, size: 64, offset: 96)
!334 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !320, file: !321, line: 104, size: 64, elements: !335)
!335 = !{!336, !342}
!336 = !DIDerivedType(tag: DW_TAG_member, scope: !334, file: !321, line: 104, baseType: !337, size: 64)
!337 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !334, file: !321, line: 104, size: 64, elements: !338)
!338 = !{!339, !341}
!339 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !337, file: !321, line: 104, baseType: !340, size: 32)
!340 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !317, line: 27, baseType: !12)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !337, file: !321, line: 104, baseType: !340, size: 32, offset: 32)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !334, file: !321, line: 104, baseType: !343, size: 64)
!343 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !334, file: !321, line: 104, size: 64, elements: !344)
!344 = !{!345, !346}
!345 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !343, file: !321, line: 104, baseType: !340, size: 32)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !343, file: !321, line: 104, baseType: !340, size: 32, offset: 32)
!347 = !DILocalVariable(name: "udph", scope: !2, file: !3, line: 134, type: !348)
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 64)
!349 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !350, line: 23, size: 64, elements: !351)
!350 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!351 = !{!352, !353, !354, !355}
!352 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !349, file: !350, line: 24, baseType: !316, size: 16)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !349, file: !350, line: 25, baseType: !316, size: 16, offset: 16)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !349, file: !350, line: 26, baseType: !316, size: 16, offset: 32)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !349, file: !350, line: 27, baseType: !332, size: 16, offset: 48)
!356 = !DILocalVariable(name: "destport", scope: !2, file: !3, line: 138, type: !71)
!357 = !DILocalVariable(name: "payload_size", scope: !2, file: !3, line: 142, type: !12)
!358 = !DILocalVariable(name: "key", scope: !359, file: !3, line: 146, type: !12)
!359 = distinct !DILexicalBlock(scope: !360, file: !3, line: 143, column: 28)
!360 = distinct !DILexicalBlock(scope: !2, file: !3, line: 143, column: 9)
!361 = !DILocalVariable(name: "max_thr", scope: !359, file: !3, line: 147, type: !12)
!362 = !DILocalVariable(name: "max_thr_ind", scope: !359, file: !3, line: 147, type: !12)
!363 = !DILocalVariable(name: "rv_value", scope: !359, file: !3, line: 148, type: !73)
!364 = !DILocalVariable(name: "b_info", scope: !359, file: !3, line: 149, type: !74)
!365 = !DILocalVariable(name: "payload", scope: !366, file: !3, line: 152, type: !67)
!366 = distinct !DILexicalBlock(scope: !367, file: !3, line: 150, column: 49)
!367 = distinct !DILexicalBlock(scope: !359, file: !3, line: 150, column: 13)
!368 = !DILocalVariable(name: "rv", scope: !366, file: !3, line: 156, type: !272)
!369 = !DILocalVariable(name: "payload", scope: !370, file: !3, line: 207, type: !67)
!370 = distinct !DILexicalBlock(scope: !371, file: !3, line: 204, column: 27)
!371 = distinct !DILexicalBlock(scope: !359, file: !3, line: 204, column: 13)
!372 = !DILocalVariable(name: "rv", scope: !370, file: !3, line: 211, type: !272)
!373 = !DILocalVariable(name: "rv_update", scope: !374, file: !3, line: 229, type: !272)
!374 = distinct !DILexicalBlock(scope: !371, file: !3, line: 219, column: 14)
!375 = !DILocalVariable(name: "key", scope: !376, file: !3, line: 255, type: !12)
!376 = distinct !DILexicalBlock(scope: !360, file: !3, line: 252, column: 10)
!377 = !DILocalVariable(name: "insert_value", scope: !376, file: !3, line: 255, type: !12)
!378 = !DILocalVariable(name: "srcip", scope: !376, file: !3, line: 257, type: !12)
!379 = !DILocalVariable(name: "index_value", scope: !376, file: !3, line: 258, type: !73)
!380 = !DILocalVariable(name: "rv_value", scope: !381, file: !3, line: 261, type: !73)
!381 = distinct !DILexicalBlock(scope: !382, file: !3, line: 259, column: 34)
!382 = distinct !DILexicalBlock(scope: !376, file: !3, line: 259, column: 13)
!383 = !DILocalVariable(name: "index_rv", scope: !381, file: !3, line: 267, type: !272)
!384 = !DILocalVariable(name: "b_info", scope: !381, file: !3, line: 274, type: !75)
!385 = !DILocalVariable(name: "rv", scope: !376, file: !3, line: 297, type: !74)
!386 = !DILocalVariable(name: "qt", scope: !387, file: !3, line: 305, type: !12)
!387 = distinct !DILexicalBlock(scope: !388, file: !3, line: 303, column: 14)
!388 = distinct !DILexicalBlock(scope: !376, file: !3, line: 298, column: 13)
!389 = !DILocalVariable(name: "rv_pop", scope: !387, file: !3, line: 306, type: !272)
!390 = !DILocalVariable(name: "rvl", scope: !391, file: !3, line: 317, type: !272)
!391 = distinct !DILexicalBlock(scope: !392, file: !3, line: 307, column: 29)
!392 = distinct !DILexicalBlock(scope: !387, file: !3, line: 307, column: 17)
!393 = !DILocalVariable(name: "tail_adj_rv", scope: !394, file: !3, line: 327, type: !272)
!394 = distinct !DILexicalBlock(scope: !392, file: !3, line: 324, column: 18)
!395 = !DILocalVariable(name: "p_begin", scope: !394, file: !3, line: 333, type: !67)
!396 = !DILocalVariable(name: "p_end", scope: !394, file: !3, line: 334, type: !67)
!397 = !DILocalVariable(name: "p_eth", scope: !394, file: !3, line: 336, type: !308)
!398 = !DILocalVariable(name: "p_iph", scope: !394, file: !3, line: 341, type: !319)
!399 = !DILocalVariable(name: "p_udph", scope: !394, file: !3, line: 347, type: !348)
!400 = !DILocalVariable(name: "p_data", scope: !394, file: !3, line: 373, type: !67)
!401 = !DICompositeType(tag: DW_TAG_array_type, baseType: !93, size: 176, elements: !258)
!402 = !{i32 7, !"Dwarf Version", i32 5}
!403 = !{i32 2, !"Debug Info Version", i32 3}
!404 = !{i32 1, !"wchar_size", i32 4}
!405 = !{i32 7, !"frame-pointer", i32 2}
!406 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!407 = !DILocation(line: 0, scope: !2)
!408 = !DILocation(line: 118, column: 41, scope: !2)
!409 = !{!410, !411, i64 0}
!410 = !{!"xdp_md", !411, i64 0, !411, i64 4, !411, i64 8, !411, i64 12, !411, i64 16, !411, i64 20}
!411 = !{!"int", !412, i64 0}
!412 = !{!"omnipotent char", !413, i64 0}
!413 = !{!"Simple C/C++ TBAA"}
!414 = !DILocation(line: 118, column: 27, scope: !2)
!415 = !DILocation(line: 118, column: 19, scope: !2)
!416 = !DILocation(line: 119, column: 39, scope: !2)
!417 = !{!410, !411, i64 4}
!418 = !DILocation(line: 119, column: 25, scope: !2)
!419 = !DILocation(line: 119, column: 17, scope: !2)
!420 = !DILocation(line: 120, column: 26, scope: !2)
!421 = !DILocation(line: 121, column: 15, scope: !422)
!422 = distinct !DILexicalBlock(scope: !2, file: !3, line: 121, column: 9)
!423 = !DILocation(line: 121, column: 39, scope: !422)
!424 = !DILocation(line: 121, column: 9, scope: !2)
!425 = !DILocation(line: 124, column: 9, scope: !426)
!426 = distinct !DILexicalBlock(scope: !2, file: !3, line: 124, column: 9)
!427 = !{!428, !429, i64 12}
!428 = !{!"ethhdr", !412, i64 0, !412, i64 6, !429, i64 12}
!429 = !{!"short", !412, i64 0}
!430 = !DILocation(line: 124, column: 33, scope: !426)
!431 = !DILocation(line: 124, column: 9, scope: !2)
!432 = !DILocation(line: 128, column: 39, scope: !433)
!433 = distinct !DILexicalBlock(scope: !2, file: !3, line: 128, column: 9)
!434 = !DILocation(line: 128, column: 62, scope: !433)
!435 = !DILocation(line: 128, column: 9, scope: !2)
!436 = !DILocation(line: 131, column: 14, scope: !437)
!437 = distinct !DILexicalBlock(scope: !2, file: !3, line: 131, column: 9)
!438 = !{!439, !412, i64 9}
!439 = !{!"iphdr", !412, i64 0, !412, i64 0, !412, i64 1, !429, i64 2, !429, i64 4, !429, i64 6, !412, i64 8, !412, i64 9, !429, i64 10, !412, i64 12}
!440 = !DILocation(line: 131, column: 23, scope: !437)
!441 = !DILocation(line: 131, column: 9, scope: !2)
!442 = !DILocation(line: 135, column: 62, scope: !443)
!443 = distinct !DILexicalBlock(scope: !2, file: !3, line: 135, column: 9)
!444 = !DILocation(line: 135, column: 86, scope: !443)
!445 = !DILocation(line: 135, column: 9, scope: !2)
!446 = !DILocation(line: 138, column: 28, scope: !2)
!447 = !{!448, !429, i64 2}
!448 = !{!"udphdr", !429, i64 0, !429, i64 2, !429, i64 4, !429, i64 6}
!449 = !DILocation(line: 139, column: 29, scope: !450)
!450 = distinct !DILexicalBlock(scope: !2, file: !3, line: 139, column: 9)
!451 = !DILocation(line: 139, column: 9, scope: !2)
!452 = !DILocation(line: 142, column: 30, scope: !2)
!453 = !DILocation(line: 142, column: 26, scope: !2)
!454 = !DILocation(line: 143, column: 22, scope: !360)
!455 = !DILocation(line: 143, column: 9, scope: !2)
!456 = !DILocation(line: 144, column: 9, scope: !457)
!457 = distinct !DILexicalBlock(scope: !359, file: !3, line: 144, column: 9)
!458 = !DILocation(line: 146, column: 9, scope: !359)
!459 = !DILocation(line: 0, scope: !359)
!460 = !DILocation(line: 146, column: 15, scope: !359)
!461 = !{!411, !411, i64 0}
!462 = !DILocation(line: 147, column: 9, scope: !359)
!463 = !DILocation(line: 147, column: 28, scope: !359)
!464 = !DILocation(line: 148, column: 36, scope: !359)
!465 = !DILocation(line: 148, column: 27, scope: !359)
!466 = !DILocation(line: 150, column: 22, scope: !367)
!467 = !DILocation(line: 150, column: 30, scope: !367)
!468 = !DILocation(line: 150, column: 33, scope: !367)
!469 = !DILocation(line: 150, column: 43, scope: !367)
!470 = !DILocation(line: 150, column: 13, scope: !359)
!471 = !DILocation(line: 151, column: 13, scope: !472)
!472 = distinct !DILexicalBlock(scope: !366, file: !3, line: 151, column: 13)
!473 = !DILocation(line: 0, scope: !366)
!474 = !DILocation(line: 153, column: 25, scope: !475)
!475 = distinct !DILexicalBlock(scope: !366, file: !3, line: 153, column: 17)
!476 = !DILocation(line: 153, column: 41, scope: !475)
!477 = !DILocation(line: 153, column: 17, scope: !366)
!478 = !DILocation(line: 156, column: 23, scope: !366)
!479 = !DILocation(line: 157, column: 20, scope: !480)
!480 = distinct !DILexicalBlock(scope: !366, file: !3, line: 157, column: 17)
!481 = !DILocation(line: 157, column: 17, scope: !366)
!482 = !DILocation(line: 158, column: 17, scope: !483)
!483 = distinct !DILexicalBlock(scope: !484, file: !3, line: 158, column: 17)
!484 = distinct !DILexicalBlock(scope: !480, file: !3, line: 157, column: 25)
!485 = !DILocation(line: 159, column: 17, scope: !484)
!486 = !DILocation(line: 161, column: 13, scope: !487)
!487 = distinct !DILexicalBlock(scope: !366, file: !3, line: 161, column: 13)
!488 = !DILocation(line: 162, column: 13, scope: !366)
!489 = !DILocation(line: 166, column: 45, scope: !490)
!490 = distinct !DILexicalBlock(scope: !491, file: !3, line: 164, column: 29)
!491 = distinct !DILexicalBlock(scope: !359, file: !3, line: 164, column: 13)
!492 = !DILocation(line: 167, column: 24, scope: !493)
!493 = distinct !DILexicalBlock(scope: !490, file: !3, line: 167, column: 17)
!494 = !DILocation(line: 167, column: 17, scope: !490)
!495 = !DILocation(line: 168, column: 17, scope: !496)
!496 = distinct !DILexicalBlock(scope: !497, file: !3, line: 168, column: 17)
!497 = distinct !DILexicalBlock(scope: !493, file: !3, line: 167, column: 33)
!498 = !DILocation(line: 169, column: 17, scope: !497)
!499 = !DILocation(line: 171, column: 25, scope: !500)
!500 = distinct !DILexicalBlock(scope: !490, file: !3, line: 171, column: 17)
!501 = !{!502, !411, i64 4}
!502 = !{!"backend_info", !411, i64 0, !411, i64 4, !429, i64 8, !412, i64 10}
!503 = !DILocation(line: 171, column: 34, scope: !500)
!504 = !DILocation(line: 0, scope: !490)
!505 = !DILocation(line: 171, column: 17, scope: !490)
!506 = !DILocation(line: 173, column: 29, scope: !507)
!507 = distinct !DILexicalBlock(scope: !500, file: !3, line: 171, column: 45)
!508 = !DILocation(line: 174, column: 13, scope: !507)
!509 = !DILocation(line: 175, column: 16, scope: !490)
!510 = !DILocation(line: 177, column: 13, scope: !511)
!511 = distinct !DILexicalBlock(scope: !359, file: !3, line: 177, column: 13)
!512 = !DILocation(line: 177, column: 23, scope: !511)
!513 = !DILocation(line: 177, column: 13, scope: !359)
!514 = !DILocation(line: 179, column: 45, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !3, line: 177, column: 29)
!516 = !DILocation(line: 180, column: 24, scope: !517)
!517 = distinct !DILexicalBlock(scope: !515, file: !3, line: 180, column: 17)
!518 = !DILocation(line: 180, column: 17, scope: !515)
!519 = !DILocation(line: 181, column: 17, scope: !520)
!520 = distinct !DILexicalBlock(scope: !521, file: !3, line: 181, column: 17)
!521 = distinct !DILexicalBlock(scope: !517, file: !3, line: 180, column: 33)
!522 = !DILocation(line: 182, column: 17, scope: !521)
!523 = !DILocation(line: 184, column: 25, scope: !524)
!524 = distinct !DILexicalBlock(scope: !515, file: !3, line: 184, column: 17)
!525 = !DILocation(line: 184, column: 34, scope: !524)
!526 = !DILocation(line: 0, scope: !515)
!527 = !DILocation(line: 184, column: 17, scope: !515)
!528 = !DILocation(line: 186, column: 29, scope: !529)
!529 = distinct !DILexicalBlock(scope: !524, file: !3, line: 184, column: 45)
!530 = !DILocation(line: 187, column: 13, scope: !529)
!531 = !DILocation(line: 188, column: 16, scope: !515)
!532 = !DILocation(line: 190, column: 13, scope: !533)
!533 = distinct !DILexicalBlock(scope: !359, file: !3, line: 190, column: 13)
!534 = !DILocation(line: 190, column: 23, scope: !533)
!535 = !DILocation(line: 190, column: 13, scope: !359)
!536 = !DILocation(line: 192, column: 45, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !3, line: 190, column: 29)
!538 = !DILocation(line: 193, column: 24, scope: !539)
!539 = distinct !DILexicalBlock(scope: !537, file: !3, line: 193, column: 17)
!540 = !DILocation(line: 193, column: 17, scope: !537)
!541 = !DILocation(line: 194, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !543, file: !3, line: 194, column: 17)
!543 = distinct !DILexicalBlock(scope: !539, file: !3, line: 193, column: 33)
!544 = !DILocation(line: 195, column: 17, scope: !543)
!545 = !DILocation(line: 197, column: 25, scope: !546)
!546 = distinct !DILexicalBlock(scope: !537, file: !3, line: 197, column: 17)
!547 = !DILocation(line: 197, column: 34, scope: !546)
!548 = !DILocation(line: 0, scope: !537)
!549 = !DILocation(line: 197, column: 17, scope: !537)
!550 = !DILocation(line: 199, column: 29, scope: !551)
!551 = distinct !DILexicalBlock(scope: !546, file: !3, line: 197, column: 45)
!552 = !DILocation(line: 200, column: 13, scope: !551)
!553 = !DILocation(line: 201, column: 16, scope: !537)
!554 = !DILocation(line: 202, column: 9, scope: !537)
!555 = !DILocation(line: 204, column: 21, scope: !371)
!556 = !DILocation(line: 204, column: 13, scope: !359)
!557 = !DILocation(line: 205, column: 13, scope: !558)
!558 = distinct !DILexicalBlock(scope: !370, file: !3, line: 205, column: 13)
!559 = !DILocation(line: 0, scope: !370)
!560 = !DILocation(line: 208, column: 25, scope: !561)
!561 = distinct !DILexicalBlock(scope: !370, file: !3, line: 208, column: 17)
!562 = !DILocation(line: 208, column: 41, scope: !561)
!563 = !DILocation(line: 208, column: 17, scope: !370)
!564 = !DILocation(line: 211, column: 23, scope: !370)
!565 = !DILocation(line: 212, column: 20, scope: !566)
!566 = distinct !DILexicalBlock(scope: !370, file: !3, line: 212, column: 17)
!567 = !DILocation(line: 212, column: 17, scope: !370)
!568 = !DILocation(line: 213, column: 17, scope: !569)
!569 = distinct !DILexicalBlock(scope: !570, file: !3, line: 213, column: 17)
!570 = distinct !DILexicalBlock(scope: !566, file: !3, line: 212, column: 25)
!571 = !DILocation(line: 214, column: 17, scope: !570)
!572 = !DILocation(line: 216, column: 13, scope: !573)
!573 = distinct !DILexicalBlock(scope: !370, file: !3, line: 216, column: 13)
!574 = !DILocation(line: 217, column: 13, scope: !370)
!575 = !DILocation(line: 222, column: 13, scope: !576)
!576 = distinct !DILexicalBlock(scope: !374, file: !3, line: 222, column: 13)
!577 = !DILocation(line: 223, column: 45, scope: !374)
!578 = !DILocation(line: 224, column: 24, scope: !579)
!579 = distinct !DILexicalBlock(scope: !374, file: !3, line: 224, column: 17)
!580 = !DILocation(line: 224, column: 17, scope: !374)
!581 = !DILocation(line: 225, column: 17, scope: !582)
!582 = distinct !DILexicalBlock(scope: !583, file: !3, line: 225, column: 17)
!583 = distinct !DILexicalBlock(scope: !579, file: !3, line: 224, column: 33)
!584 = !DILocation(line: 226, column: 17, scope: !583)
!585 = !DILocation(line: 228, column: 21, scope: !374)
!586 = !DILocation(line: 228, column: 29, scope: !374)
!587 = !DILocation(line: 229, column: 30, scope: !374)
!588 = !DILocation(line: 0, scope: !374)
!589 = !DILocation(line: 230, column: 27, scope: !590)
!590 = distinct !DILexicalBlock(scope: !374, file: !3, line: 230, column: 17)
!591 = !DILocation(line: 230, column: 17, scope: !374)
!592 = !DILocation(line: 231, column: 17, scope: !593)
!593 = distinct !DILexicalBlock(scope: !594, file: !3, line: 231, column: 17)
!594 = distinct !DILexicalBlock(scope: !590, file: !3, line: 230, column: 32)
!595 = !DILocation(line: 232, column: 17, scope: !594)
!596 = !DILocation(line: 235, column: 13, scope: !597)
!597 = distinct !DILexicalBlock(scope: !374, file: !3, line: 235, column: 13)
!598 = !DILocation(line: 236, column: 13, scope: !374)
!599 = !DILocation(line: 237, column: 41, scope: !374)
!600 = !DILocation(line: 237, column: 13, scope: !374)
!601 = !DILocation(line: 239, column: 31, scope: !374)
!602 = !{!412, !412, i64 0}
!603 = !DILocation(line: 239, column: 18, scope: !374)
!604 = !DILocation(line: 239, column: 24, scope: !374)
!605 = !DILocation(line: 240, column: 34, scope: !374)
!606 = !DILocation(line: 240, column: 24, scope: !374)
!607 = !DILocation(line: 242, column: 34, scope: !374)
!608 = !DILocation(line: 242, column: 19, scope: !374)
!609 = !DILocation(line: 242, column: 26, scope: !374)
!610 = !{!448, !429, i64 0}
!611 = !DILocation(line: 243, column: 34, scope: !374)
!612 = !{!502, !429, i64 8}
!613 = !DILocation(line: 243, column: 24, scope: !374)
!614 = !DILocation(line: 244, column: 18, scope: !374)
!615 = !DILocation(line: 245, column: 38, scope: !374)
!616 = !DILocalVariable(name: "sum", scope: !617, file: !3, line: 71, type: !70)
!617 = distinct !DISubprogram(name: "ip_checksum", scope: !3, file: !3, line: 70, type: !618, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !621)
!618 = !DISubroutineType(types: !619)
!619 = !{!71, !620, !6}
!620 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!621 = !{!622, !623, !616}
!622 = !DILocalVariable(name: "buf", arg: 1, scope: !617, file: !3, line: 70, type: !620)
!623 = !DILocalVariable(name: "bufsz", arg: 2, scope: !617, file: !3, line: 70, type: !6)
!624 = !DILocation(line: 0, scope: !617, inlinedAt: !625)
!625 = distinct !DILocation(line: 245, column: 26, scope: !374)
!626 = !DILocation(line: 73, column: 16, scope: !627, inlinedAt: !625)
!627 = distinct !DILexicalBlock(scope: !617, file: !3, line: 72, column: 23)
!628 = !{!429, !429, i64 0}
!629 = !DILocation(line: 74, column: 12, scope: !627, inlinedAt: !625)
!630 = !DILocation(line: 73, column: 13, scope: !627, inlinedAt: !625)
!631 = !DILocation(line: 80, column: 16, scope: !617, inlinedAt: !625)
!632 = !DILocation(line: 80, column: 33, scope: !617, inlinedAt: !625)
!633 = !DILocation(line: 80, column: 26, scope: !617, inlinedAt: !625)
!634 = !DILocation(line: 81, column: 33, scope: !617, inlinedAt: !625)
!635 = !DILocation(line: 81, column: 26, scope: !617, inlinedAt: !625)
!636 = !DILocation(line: 82, column: 12, scope: !617, inlinedAt: !625)
!637 = !DILocation(line: 245, column: 24, scope: !374)
!638 = !{!439, !429, i64 10}
!639 = !DILocation(line: 246, column: 19, scope: !374)
!640 = !DILocation(line: 246, column: 25, scope: !374)
!641 = !{!448, !429, i64 6}
!642 = !DILocalVariable(name: "ip", arg: 1, scope: !643, file: !3, line: 85, type: !319)
!643 = distinct !DISubprogram(name: "udp_checksum", scope: !3, file: !3, line: 85, type: !644, scopeLine: 86, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !646)
!644 = !DISubroutineType(types: !645)
!645 = !{!71, !319, !348, !67}
!646 = !{!642, !647, !648, !649, !650, !651}
!647 = !DILocalVariable(name: "udp", arg: 2, scope: !643, file: !3, line: 85, type: !348)
!648 = !DILocalVariable(name: "data_end", arg: 3, scope: !643, file: !3, line: 85, type: !67)
!649 = !DILocalVariable(name: "csum", scope: !643, file: !3, line: 87, type: !71)
!650 = !DILocalVariable(name: "buf", scope: !643, file: !3, line: 88, type: !86)
!651 = !DILocalVariable(name: "i", scope: !652, file: !3, line: 98, type: !6)
!652 = distinct !DILexicalBlock(scope: !643, file: !3, line: 98, column: 5)
!653 = !DILocation(line: 0, scope: !643, inlinedAt: !654)
!654 = distinct !DILocation(line: 247, column: 27, scope: !374)
!655 = !DILocation(line: 91, column: 10, scope: !643, inlinedAt: !654)
!656 = !DILocation(line: 92, column: 10, scope: !643, inlinedAt: !654)
!657 = !DILocation(line: 93, column: 10, scope: !643, inlinedAt: !654)
!658 = !DILocation(line: 94, column: 33, scope: !643, inlinedAt: !654)
!659 = !DILocation(line: 95, column: 18, scope: !643, inlinedAt: !654)
!660 = !{!448, !429, i64 4}
!661 = !DILocation(line: 95, column: 10, scope: !643, inlinedAt: !654)
!662 = !DILocation(line: 0, scope: !652, inlinedAt: !654)
!663 = !DILocation(line: 98, column: 5, scope: !652, inlinedAt: !654)
!664 = !DILocation(line: 102, column: 14, scope: !665, inlinedAt: !654)
!665 = distinct !DILexicalBlock(scope: !666, file: !3, line: 98, column: 49)
!666 = distinct !DILexicalBlock(scope: !652, file: !3, line: 98, column: 5)
!667 = distinct !{!667, !663, !668, !669}
!668 = !DILocation(line: 104, column: 5, scope: !652, inlinedAt: !654)
!669 = !{!"llvm.loop.mustprogress"}
!670 = !DILocation(line: 98, column: 43, scope: !666, inlinedAt: !654)
!671 = !DILocation(line: 102, column: 17, scope: !665, inlinedAt: !654)
!672 = !DILocation(line: 98, column: 23, scope: !666, inlinedAt: !654)
!673 = !DILocation(line: 106, column: 9, scope: !674, inlinedAt: !654)
!674 = distinct !DILexicalBlock(scope: !643, file: !3, line: 106, column: 9)
!675 = !DILocation(line: 106, column: 21, scope: !674, inlinedAt: !654)
!676 = !DILocation(line: 106, column: 25, scope: !674, inlinedAt: !654)
!677 = !DILocation(line: 106, column: 9, scope: !643, inlinedAt: !654)
!678 = !DILocation(line: 108, column: 17, scope: !679, inlinedAt: !654)
!679 = distinct !DILexicalBlock(scope: !674, file: !3, line: 106, column: 38)
!680 = !DILocation(line: 108, column: 14, scope: !679, inlinedAt: !654)
!681 = !DILocation(line: 109, column: 5, scope: !679, inlinedAt: !654)
!682 = !DILocation(line: 111, column: 11, scope: !643, inlinedAt: !654)
!683 = !DILocation(line: 247, column: 25, scope: !374)
!684 = !DILocation(line: 248, column: 13, scope: !685)
!685 = distinct !DILexicalBlock(scope: !374, file: !3, line: 248, column: 13)
!686 = !DILocation(line: 249, column: 13, scope: !374)
!687 = !DILocation(line: 251, column: 5, scope: !360)
!688 = !DILocation(line: 253, column: 9, scope: !689)
!689 = distinct !DILexicalBlock(scope: !376, file: !3, line: 253, column: 9)
!690 = !DILocation(line: 255, column: 9, scope: !376)
!691 = !DILocation(line: 0, scope: !376)
!692 = !DILocation(line: 255, column: 15, scope: !376)
!693 = !DILocation(line: 255, column: 24, scope: !376)
!694 = !DILocation(line: 257, column: 9, scope: !376)
!695 = !DILocation(line: 257, column: 28, scope: !376)
!696 = !DILocation(line: 257, column: 15, scope: !376)
!697 = !DILocation(line: 258, column: 39, scope: !376)
!698 = !DILocation(line: 259, column: 25, scope: !382)
!699 = !DILocation(line: 259, column: 13, scope: !376)
!700 = !DILocation(line: 261, column: 40, scope: !381)
!701 = !DILocation(line: 0, scope: !381)
!702 = !DILocation(line: 262, column: 26, scope: !703)
!703 = distinct !DILexicalBlock(scope: !381, file: !3, line: 262, column: 17)
!704 = !DILocation(line: 262, column: 17, scope: !381)
!705 = !DILocation(line: 261, column: 31, scope: !381)
!706 = !DILocation(line: 263, column: 33, scope: !703)
!707 = !DILocation(line: 0, scope: !703)
!708 = !DILocation(line: 266, column: 13, scope: !709)
!709 = distinct !DILexicalBlock(scope: !381, file: !3, line: 266, column: 13)
!710 = !DILocation(line: 267, column: 29, scope: !381)
!711 = !DILocation(line: 268, column: 26, scope: !712)
!712 = distinct !DILexicalBlock(scope: !381, file: !3, line: 268, column: 17)
!713 = !DILocation(line: 268, column: 17, scope: !381)
!714 = !DILocation(line: 269, column: 17, scope: !715)
!715 = distinct !DILexicalBlock(scope: !716, file: !3, line: 269, column: 17)
!716 = distinct !DILexicalBlock(scope: !712, file: !3, line: 268, column: 31)
!717 = !DILocation(line: 270, column: 17, scope: !716)
!718 = !DILocation(line: 272, column: 13, scope: !719)
!719 = distinct !DILexicalBlock(scope: !381, file: !3, line: 272, column: 13)
!720 = !DILocation(line: 274, column: 13, scope: !381)
!721 = !DILocation(line: 274, column: 33, scope: !381)
!722 = !DILocation(line: 276, column: 20, scope: !381)
!723 = !DILocation(line: 276, column: 29, scope: !381)
!724 = !DILocation(line: 277, column: 33, scope: !381)
!725 = !DILocation(line: 277, column: 20, scope: !381)
!726 = !DILocation(line: 277, column: 26, scope: !381)
!727 = !{!502, !411, i64 0}
!728 = !DILocation(line: 278, column: 34, scope: !381)
!729 = !DILocation(line: 278, column: 20, scope: !381)
!730 = !DILocation(line: 278, column: 26, scope: !381)
!731 = !DILocation(line: 279, column: 13, scope: !381)
!732 = !DILocation(line: 280, column: 24, scope: !381)
!733 = !DILocation(line: 281, column: 26, scope: !734)
!734 = distinct !DILexicalBlock(scope: !381, file: !3, line: 281, column: 17)
!735 = !DILocation(line: 281, column: 17, scope: !381)
!736 = !DILocation(line: 282, column: 17, scope: !737)
!737 = distinct !DILexicalBlock(scope: !738, file: !3, line: 282, column: 17)
!738 = distinct !DILexicalBlock(scope: !734, file: !3, line: 281, column: 31)
!739 = !DILocation(line: 283, column: 17, scope: !738)
!740 = !DILocation(line: 286, column: 25, scope: !381)
!741 = !DILocation(line: 287, column: 13, scope: !742)
!742 = distinct !DILexicalBlock(scope: !381, file: !3, line: 287, column: 13)
!743 = !DILocation(line: 288, column: 24, scope: !381)
!744 = !DILocation(line: 289, column: 26, scope: !745)
!745 = distinct !DILexicalBlock(scope: !381, file: !3, line: 289, column: 17)
!746 = !DILocation(line: 289, column: 17, scope: !381)
!747 = !DILocation(line: 290, column: 17, scope: !748)
!748 = distinct !DILexicalBlock(scope: !749, file: !3, line: 290, column: 17)
!749 = distinct !DILexicalBlock(scope: !745, file: !3, line: 289, column: 31)
!750 = !DILocation(line: 291, column: 17, scope: !749)
!751 = !DILocation(line: 293, column: 13, scope: !752)
!752 = distinct !DILexicalBlock(scope: !381, file: !3, line: 293, column: 13)
!753 = !DILocation(line: 294, column: 13, scope: !381)
!754 = !DILocation(line: 295, column: 9, scope: !382)
!755 = !DILocation(line: 297, column: 58, scope: !376)
!756 = !DILocation(line: 298, column: 16, scope: !388)
!757 = !DILocation(line: 298, column: 13, scope: !376)
!758 = !DILocation(line: 300, column: 13, scope: !759)
!759 = distinct !DILexicalBlock(scope: !760, file: !3, line: 300, column: 13)
!760 = distinct !DILexicalBlock(scope: !388, file: !3, line: 298, column: 25)
!761 = !DILocation(line: 301, column: 13, scope: !760)
!762 = !DILocation(line: 305, column: 13, scope: !387)
!763 = !DILocation(line: 0, scope: !387)
!764 = !DILocation(line: 306, column: 27, scope: !387)
!765 = !DILocation(line: 307, column: 24, scope: !392)
!766 = !DILocation(line: 307, column: 17, scope: !387)
!767 = !DILocation(line: 309, column: 25, scope: !768)
!768 = distinct !DILexicalBlock(scope: !391, file: !3, line: 309, column: 21)
!769 = !DILocation(line: 309, column: 34, scope: !768)
!770 = !DILocation(line: 309, column: 21, scope: !391)
!771 = !DILocation(line: 310, column: 33, scope: !772)
!772 = distinct !DILexicalBlock(scope: !768, file: !3, line: 309, column: 49)
!773 = !DILocation(line: 311, column: 21, scope: !774)
!774 = distinct !DILexicalBlock(scope: !772, file: !3, line: 311, column: 21)
!775 = !DILocation(line: 312, column: 17, scope: !772)
!776 = !DILocation(line: 314, column: 21, scope: !777)
!777 = distinct !DILexicalBlock(scope: !778, file: !3, line: 314, column: 21)
!778 = distinct !DILexicalBlock(scope: !768, file: !3, line: 313, column: 22)
!779 = !DILocation(line: 317, column: 28, scope: !391)
!780 = !DILocation(line: 0, scope: !391)
!781 = !DILocation(line: 318, column: 25, scope: !782)
!782 = distinct !DILexicalBlock(scope: !391, file: !3, line: 318, column: 21)
!783 = !DILocation(line: 318, column: 21, scope: !391)
!784 = !DILocation(line: 319, column: 21, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !3, line: 319, column: 21)
!786 = distinct !DILexicalBlock(scope: !782, file: !3, line: 318, column: 30)
!787 = !DILocation(line: 320, column: 21, scope: !786)
!788 = !DILocation(line: 326, column: 17, scope: !789)
!789 = distinct !DILexicalBlock(scope: !394, file: !3, line: 326, column: 17)
!790 = !DILocation(line: 327, column: 36, scope: !394)
!791 = !DILocation(line: 0, scope: !394)
!792 = !DILocation(line: 328, column: 33, scope: !793)
!793 = distinct !DILexicalBlock(scope: !394, file: !3, line: 328, column: 21)
!794 = !DILocation(line: 328, column: 21, scope: !394)
!795 = !DILocation(line: 329, column: 21, scope: !796)
!796 = distinct !DILexicalBlock(scope: !797, file: !3, line: 329, column: 21)
!797 = distinct !DILexicalBlock(scope: !793, file: !3, line: 328, column: 38)
!798 = !DILocation(line: 330, column: 21, scope: !797)
!799 = !DILocation(line: 333, column: 55, scope: !394)
!800 = !DILocation(line: 333, column: 41, scope: !394)
!801 = !DILocation(line: 333, column: 33, scope: !394)
!802 = !DILocation(line: 334, column: 53, scope: !394)
!803 = !DILocation(line: 334, column: 39, scope: !394)
!804 = !DILocation(line: 334, column: 31, scope: !394)
!805 = !DILocation(line: 336, column: 40, scope: !394)
!806 = !DILocation(line: 338, column: 29, scope: !807)
!807 = distinct !DILexicalBlock(scope: !394, file: !3, line: 338, column: 21)
!808 = !DILocation(line: 338, column: 53, scope: !807)
!809 = !DILocation(line: 338, column: 21, scope: !394)
!810 = !DILocation(line: 343, column: 53, scope: !811)
!811 = distinct !DILexicalBlock(scope: !394, file: !3, line: 343, column: 21)
!812 = !DILocation(line: 343, column: 76, scope: !811)
!813 = !DILocation(line: 343, column: 21, scope: !394)
!814 = !DILocation(line: 348, column: 76, scope: !815)
!815 = distinct !DILexicalBlock(scope: !394, file: !3, line: 348, column: 21)
!816 = !DILocation(line: 348, column: 100, scope: !815)
!817 = !DILocation(line: 348, column: 21, scope: !394)
!818 = !DILocation(line: 353, column: 17, scope: !394)
!819 = !DILocation(line: 354, column: 43, scope: !394)
!820 = !DILocation(line: 354, column: 17, scope: !394)
!821 = !DILocation(line: 357, column: 39, scope: !394)
!822 = !DILocation(line: 357, column: 24, scope: !394)
!823 = !DILocation(line: 357, column: 30, scope: !394)
!824 = !DILocation(line: 358, column: 36, scope: !394)
!825 = !DILocation(line: 358, column: 30, scope: !394)
!826 = !DILocation(line: 360, column: 24, scope: !394)
!827 = !DILocation(line: 360, column: 30, scope: !394)
!828 = !DILocation(line: 361, column: 25, scope: !394)
!829 = !DILocation(line: 361, column: 31, scope: !394)
!830 = !DILocation(line: 363, column: 34, scope: !394)
!831 = !DILocation(line: 363, column: 24, scope: !394)
!832 = !DILocation(line: 363, column: 32, scope: !394)
!833 = !{!439, !429, i64 2}
!834 = !DILocation(line: 364, column: 31, scope: !394)
!835 = !DILocation(line: 364, column: 25, scope: !394)
!836 = !DILocation(line: 364, column: 29, scope: !394)
!837 = !DILocation(line: 366, column: 42, scope: !394)
!838 = !DILocation(line: 366, column: 25, scope: !394)
!839 = !DILocation(line: 366, column: 32, scope: !394)
!840 = !DILocation(line: 367, column: 36, scope: !394)
!841 = !DILocation(line: 367, column: 30, scope: !394)
!842 = !DILocation(line: 369, column: 44, scope: !394)
!843 = !DILocation(line: 0, scope: !617, inlinedAt: !844)
!844 = distinct !DILocation(line: 369, column: 32, scope: !394)
!845 = !DILocation(line: 73, column: 16, scope: !627, inlinedAt: !844)
!846 = !DILocation(line: 73, column: 13, scope: !627, inlinedAt: !844)
!847 = !DILocation(line: 74, column: 12, scope: !627, inlinedAt: !844)
!848 = !DILocation(line: 80, column: 16, scope: !617, inlinedAt: !844)
!849 = !DILocation(line: 80, column: 33, scope: !617, inlinedAt: !844)
!850 = !DILocation(line: 80, column: 26, scope: !617, inlinedAt: !844)
!851 = !DILocation(line: 81, column: 33, scope: !617, inlinedAt: !844)
!852 = !DILocation(line: 81, column: 26, scope: !617, inlinedAt: !844)
!853 = !DILocation(line: 82, column: 12, scope: !617, inlinedAt: !844)
!854 = !DILocation(line: 369, column: 30, scope: !394)
!855 = !DILocation(line: 0, scope: !643, inlinedAt: !856)
!856 = distinct !DILocation(line: 370, column: 33, scope: !394)
!857 = !DILocation(line: 91, column: 10, scope: !643, inlinedAt: !856)
!858 = !DILocation(line: 92, column: 10, scope: !643, inlinedAt: !856)
!859 = !DILocation(line: 93, column: 10, scope: !643, inlinedAt: !856)
!860 = !DILocation(line: 94, column: 33, scope: !643, inlinedAt: !856)
!861 = !DILocation(line: 95, column: 10, scope: !643, inlinedAt: !856)
!862 = !DILocation(line: 0, scope: !652, inlinedAt: !856)
!863 = !DILocation(line: 98, column: 5, scope: !652, inlinedAt: !856)
!864 = !DILocation(line: 102, column: 14, scope: !665, inlinedAt: !856)
!865 = distinct !{!865, !863, !866, !669}
!866 = !DILocation(line: 104, column: 5, scope: !652, inlinedAt: !856)
!867 = !DILocation(line: 98, column: 43, scope: !666, inlinedAt: !856)
!868 = !DILocation(line: 102, column: 17, scope: !665, inlinedAt: !856)
!869 = !DILocation(line: 98, column: 23, scope: !666, inlinedAt: !856)
!870 = !DILocation(line: 106, column: 9, scope: !674, inlinedAt: !856)
!871 = !DILocation(line: 106, column: 21, scope: !674, inlinedAt: !856)
!872 = !DILocation(line: 106, column: 25, scope: !674, inlinedAt: !856)
!873 = !DILocation(line: 106, column: 9, scope: !643, inlinedAt: !856)
!874 = !DILocation(line: 108, column: 17, scope: !679, inlinedAt: !856)
!875 = !DILocation(line: 108, column: 14, scope: !679, inlinedAt: !856)
!876 = !DILocation(line: 109, column: 5, scope: !679, inlinedAt: !856)
!877 = !DILocation(line: 111, column: 11, scope: !643, inlinedAt: !856)
!878 = !DILocation(line: 370, column: 31, scope: !394)
!879 = !DILocation(line: 374, column: 28, scope: !880)
!880 = distinct !DILexicalBlock(scope: !394, file: !3, line: 374, column: 21)
!881 = !DILocation(line: 374, column: 44, scope: !880)
!882 = !DILocation(line: 374, column: 21, scope: !394)
!883 = !DILocation(line: 377, column: 17, scope: !394)
!884 = !DILocation(line: 379, column: 17, scope: !885)
!885 = distinct !DILexicalBlock(scope: !394, file: !3, line: 379, column: 17)
!886 = !DILocation(line: 380, column: 17, scope: !394)
!887 = !DILocation(line: 0, scope: !392)
!888 = !DILocation(line: 382, column: 9, scope: !388)
!889 = !DILocation(line: 385, column: 5, scope: !360)
!890 = !DILocation(line: 388, column: 1, scope: !2)
