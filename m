Return-Path: <SRS0=P06h=RT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380F2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 08:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA8B5218D0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 08:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="k6hzi4B3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfCPIWF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Mar 2019 04:22:05 -0400
Received: from mail-eopbgr70095.outbound.protection.outlook.com ([40.107.7.95]:18339
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726048AbfCPIWE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Mar 2019 04:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YxDY/QjVOy3pSoN7T5CZvTR4Gh0NaAkFA+2ZxMiKaw=;
 b=k6hzi4B39rQEMVOi8/NDOrUPstm6YWHGnIne2JPnbXjM2F0u1RSdbU+cE1uB/2e0Tlj+X9j2XOrwflG478IBA8XybviqBmRdKgNXudOZc5uUMrhXosEKcACZReBifqFtP9910RGT2z3wROT5zXkeBnkLlWnqvj7b60WbB0eUm8Y=
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com (20.178.12.74) by
 VI1PR02MB3904.eurprd02.prod.outlook.com (20.177.58.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Sat, 16 Mar 2019 08:21:58 +0000
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::38db:37eb:b43e:e4c1]) by VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::38db:37eb:b43e:e4c1%6]) with mapi id 15.20.1709.011; Sat, 16 Mar 2019
 08:21:58 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Topic: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Index: AQHU2b2vWA4BAAcLsEOjwQVlZJY0jqYK/byAgAGdyoCAAJddAIAAvECA
Date:   Sat, 16 Mar 2019 08:21:57 +0000
Message-ID: <7d8b2a46-d349-5589-229c-f0c01c510feb@axentia.se>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
 <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
 <7a48e707-bf06-6a95-e1ba-08e45481715c@ideasonboard.com>
 <20190315210806.GA1749@kunai>
In-Reply-To: <20190315210806.GA1749@kunai>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
x-originating-ip: [85.226.244.23]
x-clientproxiedby: HE1PR0701CA0047.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::15) To VI1PR02MB4542.eurprd02.prod.outlook.com
 (2603:10a6:803:b1::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d65a4120-0a0e-4479-206f-08d6a9e87421
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);SRVR:VI1PR02MB3904;
x-ms-traffictypediagnostic: VI1PR02MB3904:
x-microsoft-antispam-prvs: <VI1PR02MB390442DCDBA52F624AB44D5ABC450@VI1PR02MB3904.eurprd02.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(8936002)(36756003)(6246003)(2906002)(71190400001)(71200400001)(14454004)(4326008)(76176011)(6486002)(508600001)(52116002)(53936002)(65806001)(66066001)(65956001)(68736007)(64126003)(6512007)(6436002)(65826007)(25786009)(86362001)(31696002)(99286004)(11346002)(6506007)(53546011)(3846002)(6116002)(54906003)(31686004)(229853002)(386003)(486006)(26005)(5660300002)(110136005)(186003)(97736004)(102836004)(58126008)(106356001)(476003)(4744005)(256004)(316002)(93886005)(105586002)(14444005)(305945005)(8676002)(74482002)(7736002)(81156014)(446003)(81166006)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR02MB3904;H:VI1PR02MB4542.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xp/2SxX2gCc49O5R9Jvm3I5M3Nyai1PoOizVMxXwAifL1Napdc+EbYdUuw89I6TpuaJBFWn+pfWsHA6vjLod6mgoKeC1sFO/2KFSVsF/jujbGx14/2+/UjbFKN+VIChKShPUvd4eNm49YAhMJhuXIBVcTlvARcbCytPjljTIkABk8FTgt3ZIddgo/SfbZpGr5Wz9iFSILbFnbRTNmnjTsDE2NfS3joEYf5+kDqvzSpNGl/mJgtZhYYr4a0TJiwM3a2yRN/z17e181qaxipi2A/YpOOAeOsF52GjNXurzKCIzU1pvFsc9nz6PFpQxAcfFfGlegze+CjfRyb2qaUbggQBiuXIJXYdRgPDedOOzoNXF0XG42op3srtnzSz6XKiF7daBEGc0c8602WKUOK2FFx/8I+HBHCQjD96Hc1ZeQmY=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <96C2D9EAFF0C854493EC9D1CDE8DDFD0@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d65a4120-0a0e-4479-206f-08d6a9e87421
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 08:21:57.8277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB3904
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2019-03-15 22:08, Wolfram Sang wrote:
>=20
>>> I personally really dislike the proposed name. It is akin to the abomin=
ation
>>> where some sort of abbreviation of the types of variables are included =
also
>>> in the variable names. It's useless clutter, at least to me.
>>
>>
>> I hate to be jumping in with just a 'me-too' - but I also had a similar
>> disliking to the _errptr suffix on the function name here.
>=20
> As I said to Peter, I am not exactly happy with the naming. I just
> couldn't come up with something better. I am totally open for
> suggestions here. Let's give ourselves a few days. Maybe inspiration
> will hit one of us somehow somewhen.

I can't seem to find what you said to me anywhere, it's not in my inbox and
I don't see any (other) reply from you on patchwork for this patch either.

Perhaps a resend is in order?

Cheers,
Peter

