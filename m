Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1341C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 23:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BE8221900
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 23:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="DELd+VOy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730414AbfBRXtN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 18:49:13 -0500
Received: from mail-eopbgr60094.outbound.protection.outlook.com ([40.107.6.94]:11520
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729925AbfBRXtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 18:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV5rkpOO85Zq6LmjPRnSrGJoQKDrq3EWRcRjagrzvi8=;
 b=DELd+VOyS92WDeIfIc2qCqUl3Nsj6LJB0f9e11yiL47SFCqPXLu95xD7mTedtB6D49GHWkpDaobcWFr2fH5+704F+aUw2yPNcMODXnJOR4LB9KPVD5Vfe4zn5huhcCNzb5wo2EiCVtd48y8QIn5OVWMTUPQ71ut2/osne3JIFKc=
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com (20.178.12.74) by
 VI1PR02MB5232.eurprd02.prod.outlook.com (20.178.80.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.18; Mon, 18 Feb 2019 23:48:53 +0000
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::a1f1:5dc8:99c1:c590]) by VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::a1f1:5dc8:99c1:c590%5]) with mapi id 15.20.1622.018; Mon, 18 Feb 2019
 23:48:53 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Thread-Topic: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Thread-Index: AQHUxr4fcfLg22YnMEyOEeRi3KncSaXlR/4AgAC/IwCAADRhAA==
Date:   Mon, 18 Feb 2019 23:48:53 +0000
Message-ID: <a8b62504-49c3-33a7-e8ec-46b253af13b8@axentia.se>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato>
In-Reply-To: <20190218204122.j35itmqth3avo3a6@ninjato>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
x-originating-ip: [85.226.244.23]
x-clientproxiedby: HE1PR05CA0155.eurprd05.prod.outlook.com
 (2603:10a6:7:28::42) To VI1PR02MB4542.eurprd02.prod.outlook.com
 (2603:10a6:803:b1::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 901ed703-3b47-4c7d-ab29-08d695fba3a0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);SRVR:VI1PR02MB5232;
x-ms-traffictypediagnostic: VI1PR02MB5232:
x-microsoft-antispam-prvs: <VI1PR02MB52329AC63184F79E8D1238ACBC630@VI1PR02MB5232.eurprd02.prod.outlook.com>
x-forefront-prvs: 09525C61DB
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(136003)(39830400003)(366004)(189003)(199004)(8936002)(4744005)(8676002)(31696002)(86362001)(106356001)(6116002)(6506007)(386003)(3846002)(71190400001)(58126008)(71200400001)(53546011)(93886005)(4326008)(476003)(2616005)(64126003)(99286004)(26005)(102836004)(508600001)(486006)(14454004)(97736004)(74482002)(6246003)(81156014)(6486002)(81166006)(25786009)(229853002)(105586002)(65956001)(66066001)(65806001)(6436002)(110136005)(14444005)(305945005)(76176011)(52116002)(7736002)(31686004)(256004)(5660300002)(2906002)(68736007)(6512007)(446003)(316002)(53936002)(186003)(11346002)(36756003)(54906003)(65826007);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR02MB5232;H:VI1PR02MB4542.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtWSTFQUjAyTUI1MjMyOzIzOkJOU0V4bU03ZEU5RDNXa0FQRXBsYlR4N0VP?=
 =?utf-8?B?Z1lTM1l3Z3pYdWFIaE5kclp6dW1pTTB0dnk3a2g1dW02OWJtbXVYQ3BCbUo1?=
 =?utf-8?B?ZlRjS0tDTVE2SDRTejNOQkhUN3lHRldCZ0tKdjcyZW9GdC9hNkJCTFljdktD?=
 =?utf-8?B?aUJRWFd5cEVwYUhlVGsrUmlxN0ZMZEhpOUU5YllBNXlud04vOG9uU2hOWTZP?=
 =?utf-8?B?NzhFYVFQbXRTeitRRlRFZEx1UGRnUlpLM3IzRDhHUmlUcVFqZlh2Z0J1cDla?=
 =?utf-8?B?bENhQU5ocEFOVFZKTDhWWEtCUzBCTDQwWnpjK05rcERYQWJJZlZSbUhKUE1J?=
 =?utf-8?B?RnRjZDRUQXlZMXp2OXRERkl2ZXhGRUZyT1N4cFpGR3F3aE1jWFhOanFPMHZ4?=
 =?utf-8?B?anducXFaSzNtMVI2RDdQWXJ6SVFhbmdDTXVzZXIxNUltMTVJaXVTNHFFNEwv?=
 =?utf-8?B?cS8vMFFqbGlNRlY3TUpVMmlFSTdZOGhSb2diRk5HUEdxczBwbzYrSXRGRlYv?=
 =?utf-8?B?V2tUdHZTWngwQlhWM3d2WnNRbTVUWjFmK21Qcy9kZmVHTjJxT1p2VW03N3Iz?=
 =?utf-8?B?ZXJvVnZhSk4vUmVHRk42c2VxdmhoRnY0amNmNHk0YmVlNU40ZXE2Q0tMSkor?=
 =?utf-8?B?KzdkaW8vL0FGM1lzZ0lYdE9sMkJDdlM4TjJXM0Zwemt1ZHU1bjEybHVKM1Er?=
 =?utf-8?B?TUlkWFBWZHU3VUFRUDNOc1FsV2R4Z1NvM3NtdXZSNms0QnhRa3paRzJEQTFq?=
 =?utf-8?B?TExCVTk1Z00rN0VBbnZUL0ZVVU9VaVJiUm1EUENUYkZlaUxRVlhzb3FWTVlx?=
 =?utf-8?B?bkJGcTZqSHcxZDNPMGduTGtlNG5mV1hiWmc2VHhjamIyTmh3YnY3bCtPcXJ2?=
 =?utf-8?B?emc5VHU2RjlZb01SSCtjZDIvSVg5czJXNE9CdEJMZkF5THYrWVZ0c3ErTzkx?=
 =?utf-8?B?TENnOEVuNkhnVVViSXFMUEozeVBUY09DZFgyRFhIQ3RsYzJNT3JKQnlGM0Zt?=
 =?utf-8?B?Y012UzVkUGtZM3pkYmdUVG1hS1VsRHNaaFVzbmtSVUVCMVhsUG5mYm5XTXN3?=
 =?utf-8?B?QUd6MDhnNHZjVmtiMlF0eXZpbmp1aUVKZ0NKUlhnekVoQi8wTUp5bGJmdWJZ?=
 =?utf-8?B?VEh4eVExSUw4QWl1cHc2OUNHTXFueHlIdUN5OUIyaThwZzVjU0VVanQxUWFV?=
 =?utf-8?B?OUV4cGxkWCsxb1NISVdMTFNVWnh4Q0xERTlKSkdKQ1p3azhsV3E3NCtaVVp3?=
 =?utf-8?B?UDVoNnVOU2VKalh0R0JBZFg1TXNQZXJwY3kwYVdOVDF2YStuMGFST3FjZEtz?=
 =?utf-8?B?Ym1zQjNJSlRJcUxlTE5BTXhLRFJrYVp1SFdLVUF5bGp4REdoTnFKMW96Z2Rt?=
 =?utf-8?B?T3JDZnRNSlFOYnRXUGlNMFVDbHJhNnpOTDNYRFlqTWtIODhiNC9CWUFBaG9j?=
 =?utf-8?B?dWlYNVZ1ajJOb3RicExXNy9yWW1YWnNzTFMzWVZOVnN5VjVvMEdySUxCOEdC?=
 =?utf-8?B?VElmMXd0ZTV1ZitCcTYxVE04eDZlMzhhTnV2Mm9jdW0wQ21TUjdISEFRbEdX?=
 =?utf-8?B?U3R5R3BWaHYzc1lJS2V1Y0g0ZGxkbyswWDhpMzV3bzFvWlVrT0VIQ3VRSXFP?=
 =?utf-8?B?dkFqcFY3QjJ5cldQZmZNanhLVWZYSFJUaU4weUt3L2F6Y0RDeHp4SHh3dlly?=
 =?utf-8?B?T2ZsUTh3TjZxdGQ4Rkw2M3I2dkJjNDZHZUxtZUJ0MkFYekpzVFJ6UityQUpx?=
 =?utf-8?B?QkpmNnJPM3oxeEdjSUF5czB2eE9xVjc4L1hYT29EdmFCREJBZGY3REU0OG0z?=
 =?utf-8?B?SDd6YitFcDhhbnZ1eVFSUkVDQW9jNkU1Mk1LVlpwSGdBQTNiTHRZZGl2Z1Nx?=
 =?utf-8?B?dWxYMloxWmh3c0NOYU8vN0kyWkVSMDhwSDJ0ZXlJOEo0aStueEhZSXQrL29S?=
 =?utf-8?B?d2UrOTlIRnpteG0vS28vb0J2dGNjclEzYjF5V0tjRkhYZ2kvZkI2eHUyUVZB?=
 =?utf-8?Q?KIs7WO?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0JgP/3XbMjb+8iFgq2oIEpEB0j1MUffsjOewGWUwcUqnxYXs0rD43agAvf8YJDsXZ1lC3RykcGeZreWKiF1tMIH7F5Z+NSUfBdbben1FCfvIlYuivDwwwiX59vV7MVVe94b+QolG5NWtROmafW7YRkpboSN6zcl60czoTaEzl3qlsPAPjqas6+4f14stR7kUC1H5T99Lse3monvmLenu3kR0XdgtnkehTz1/s8suGKnlw0NJgKUzemD66UAzYf/+yZlLrIuMUCgJttv2xcn2aDfL78Sx2m07i8Tqv7Xpp1ulOW337tbZj1YgxYKRyTD82+kBcktnmEUIggbJGMJ7se8OE+nr4Dt+qtQuyY7PF/2Ywgq84AO72ouqRyr8GOjREqlxYa5EmAvCDoKT5CvHZrxdWh60xm5y9RtHjkUGkl4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <095AA99A4AC07E4C8B685BF1B45A0ADB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 901ed703-3b47-4c7d-ab29-08d695fba3a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2019 23:48:52.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5232
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gMjAxOS0wMi0xOCAyMTo0MSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBIaSBHZWVydCwNCj4+
PiArDQo+Pj4gKyAgICAgICBmcmVlX2lycShpcnEsIHByaXYpOw0KPj4+ICsgb3V0cHV0Og0KPj4+
ICsgICAgICAgcmV0ID0gZ3Bpb2RfZGlyZWN0aW9uX291dHB1dChwcml2LT5zY2wsIDEpOw0KPj4N
Cj4+IFRoaXMgbWF5IG92ZXJ3cml0ZSB0aGUgZXJyb3IgY29kZSByZXR1cm5lZCBieSByZXF1ZXN0
X2lycSgpLg0KPiANCj4gWWVhaC4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcywgaXMgdGhp
cyB0b28gZGVuc2U/DQo+IA0KPiAJcmV0ID0gZ3Bpb2RfZGlyZWN0aW9uX291dHB1dChwcml2LT5z
Y2wsIDEpID86IHJldDsNCg0KVGhhdCBtYXkgYWxzbyBvdmVyd3JpdGUgdGhlIGVycm9yIGNvZGUs
IG9mIGNvdXJzZS4gSXNuJ3QgaXQNCnVzdWFsbHkgYmVzdCB0byByZXR1cm4gdGhlIGZpcnN0IGVy
cm9yPyBJIGhhdmUgbm8gY2x1ZSBpZiB0aGF0DQpndWlkZWxpbmUgZG9lcyBub3QgYXBwbHkgaGVy
ZSwgdGhvdWdoLi4uDQoNCkNoZWVycywNClBldGVyDQo=
