create table article
(
    id                  bigint auto_increment
        primary key,
    writer              varchar(255)                        not null comment '작성자',
    publisher           varchar(255)                        not null comment '게시자',
    category            varchar(255)                        not null comment '카테고리',
    background_image_id bigint                              null comment '배경 이미지 ID',
    title               varchar(255)                        not null comment '제목',
    contents            longtext                            not null comment '내용',
    display_main_yn     char      default 'N'               not null comment '메인화면 노출여부',
    views               int                                 null comment '조회수',
    created_at          timestamp default CURRENT_TIMESTAMP null,
    updated_at          timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    deleted_at          timestamp                           null comment '삭제 일시'
);

create table banner
(
    id                     bigint auto_increment comment '배너 id'
        primary key,
    name                   varchar(255)                        not null comment '배너 제목',
    banner_image_id        bigint                              not null comment '배너 이미지 ID',
    mobile_banner_image_id bigint                              not null comment '모바일 배너 이미지 ID',
    main_wordings          varchar(255)                        not null comment '대표 문구',
    sub_wordings           varchar(255)                        null comment '서브 문구',
    wordings_color         varchar(255)                        not null comment '문구 색상',
    background_color       varchar(255)                        not null comment '배경 색상',
    location               varchar(255)                        not null comment '노출 위치',
    display_priority       int                                 not null comment '노출 순서',
    display_yn             char                                not null comment '노출 여부',
    url                    varchar(500)                        not null comment 'url',
    open_new_tab_yn        char                                not null comment '새창으로 열기 여부',
    publisher              varchar(255)                        not null comment '게시자',
    created_at             timestamp default CURRENT_TIMESTAMP null,
    updated_at             timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table file
(
    id          bigint auto_increment
        primary key,
    extension   varchar(255)                        null comment '확장자',
    origin_name varchar(255)                        null comment '원본 파일명',
    path        varchar(2000)                       null comment '파일 경로',
    created_at  timestamp default CURRENT_TIMESTAMP null,
    updated_at  timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create table newsletter
(
    id                     bigint auto_increment comment '뉴스레터 id'
        primary key,
    title                  varchar(255)                        not null comment '제목',
    management_type        varchar(255)                        not null comment '사용처',
    status                 varchar(255)                        not null comment '상태',
    send_type              varchar(255)                        not null comment '발송 구분',
    html_contents          longtext                            null comment 'html 변환 내용',
    editor_contents        longtext                            null comment '에디터 내용',
    scheduled_send_time    timestamp                           null comment '발송 예약 시간',
    actual_send_time       timestamp                           null comment '실제 발송 시간',
    newsletter_template_yn char                                not null comment '템플릿 사용여부',
    newsletter_template_id bigint                              null comment '템플릿 id',
    display_yn             char                                not null comment '클라이언트 노출여부',
    publisher              varchar(255)                        not null comment '담당자',
    created_at             timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at             timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table newsletter_click_log
(
    id            bigint auto_increment
        primary key,
    email         varchar(255)  not null comment '이메일',
    os            varchar(255)  not null comment '운영체제',
    device        varchar(255)  not null comment '기기',
    browser       varchar(255)  not null comment '브라우저',
    url           varchar(2000) not null comment '클릭한 url',
    newsletter_id bigint        not null comment '뉴스레터 id',
    clicked_at    timestamp     null comment '클릭 일시'
);

create table newsletter_open_log
(
    id            bigint auto_increment
        primary key,
    email         varchar(255) not null comment '이메일',
    os            varchar(255) not null comment '운영체제',
    device        varchar(255) not null comment '기기',
    browser       varchar(255) not null comment '브라우저',
    newsletter_id bigint       not null comment '뉴스레터 id',
    opened_at     timestamp    null comment '오픈 일시'
);

create table newsletter_receiver
(
    id            bigint auto_increment
        primary key,
    email         varchar(255)                        not null comment '이메일',
    name          varchar(255)                        null comment '이름',
    type          varchar(255)                        null comment '회원타입',
    status        varchar(255)                        not null comment '발신 상태',
    newsletter_id bigint                              not null comment '뉴스레터 id',
    send_time     timestamp                           null comment '발송 시간',
    created_at    timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at    timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table newsletter_subscriber
(
    id         bigint auto_increment
        primary key,
    email      varchar(255)                        not null comment '이메일',
    name       varchar(255)                        null comment '이름',
    type       varchar(255)                        null comment '구독자 회원유형',
    created_at timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table newsletter_template
(
    id              bigint auto_increment comment '템플릿 id'
        primary key,
    management_type varchar(255)                        null comment '사용처',
    name            varchar(255)                        not null comment '이름',
    header          longtext                            null comment 'header',
    footer          longtext                            null comment 'footer',
    created_at      timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at      timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table newsletter_unsubscriber
(
    id         bigint auto_increment
        primary key,
    email      varchar(255)                        not null comment '이메일',
    type       varchar(255)                        null comment '수신거부 회원유형',
    created_at timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table playlist
(
    id         bigint auto_increment comment '서브 영상 키'
        primary key,
    title      varchar(255)                        not null comment '영상 제목',
    publisher  varchar(255)                        not null comment '게시자',
    created_at timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table project
(
    id              bigint auto_increment
        primary key,
    main_category   varchar(255)                        null comment '대분류',
    sub_category    varchar(255)                        null comment '소분류',
    building_name   varchar(255)                        null comment '건물명',
    design          varchar(255)                        null comment '설계사',
    designer        varchar(255)                        null comment '디자이너',
    location        varchar(255)                        null comment '로케이션',
    year            int                                 null comment '연도',
    total_area      int                                 null comment '연면적',
    contractor      varchar(255)                        null comment '시공사',
    photographer    varchar(255)                        null comment '사진작가',
    manufacturer    varchar(255)                        null comment '제조사',
    capacity        int                                 null comment '용량',
    module          varchar(255)                        null comment '모듈',
    system_name     varchar(255)                        null comment '시스템',
    structure       varchar(255)                        null comment '구조물',
    publisher       varchar(255)                        not null comment '게시자',
    main_image_id   bigint                              null comment '대표 이미지 ID',
    contents        longtext                            null comment '내용',
    display_main_yn char      default 'N'               null comment '메인화면 노출여부',
    created_at      timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at      timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
)
    comment '프로젝트 테이블';

create table project_image
(
    id         bigint auto_increment
        primary key,
    project_id bigint                              not null comment '프로젝트 ID',
    file_id    bigint                              not null comment '파일 ID',
    ordering   int                                 null comment '정렬 순서',
    created_at timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
)
    comment '프로젝트 이미지 테이블';

create table terms
(
    id         bigint auto_increment comment '배너 id'
        primary key,
    title      varchar(255)                        not null comment '약관명',
    contents   longtext                            not null comment '약관 내용',
    type       varchar(255)                        not null comment '약관 타입',
    visible    tinyint(1)                          not null comment '숨김 여부',
    publisher  varchar(255)                        not null comment '게시자',
    created_at timestamp default CURRENT_TIMESTAMP null,
    updated_at timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

create table video
(
    id               bigint auto_increment comment '영상 키'
        primary key,
    title            varchar(255)                        not null comment '영상 제목',
    category         varchar(255)                        null comment '영상 카테고리',
    youtube_url      varchar(2048)                       not null comment '영상 URL',
    thumbnail_url    varchar(2048)                       not null comment '썸네일 URL',
    contents         longtext                            null comment '내용',
    ordering         int                                 not null comment '영상 번호',
    playlist_id      bigint                              not null comment '플레이리스트 id',
    best_video_yn    char      default 'N'               not null comment '베스트 비디오 여부',
    display_priority int                                 null comment '금주의 조회순 설정값',
    publisher        varchar(255)                        not null comment '게시자',
    created_at       timestamp default CURRENT_TIMESTAMP null comment '생성 일시',
    updated_at       timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '수정 일시'
);

