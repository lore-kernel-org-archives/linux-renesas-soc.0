Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0499CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B591320675
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YeXECi7U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfCFL3B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 06:29:01 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:54223 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfCFL3B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 06:29:01 -0500
X-IronPort-AV: E=Sophos;i="5.58,447,1544511600"; 
   d="scan'208";a="25700587"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 06 Mar 2019 04:29:01 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 6 Mar 2019 04:28:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuwPSkSYfP4VAcIhmZyKUlZpXvD819zuhyRMj+/kjxw=;
 b=YeXECi7UqxblhJf5ixTrEv+kzvvgdYeEOhPUmyYBN8M7oNyFKOFnxhMrUzHV/ov5TIiV269Spk9pEpO0JkvgA5PjMeKBBPOf25sQabqYpVQGWHnKyxps8k0dwwM/K4Qne5JW6tuopMtidDroC2rN/ERoVZuUis0GXPgl3NtK7aA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB0066.namprd11.prod.outlook.com (10.161.154.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Wed, 6 Mar 2019 11:28:56 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1665.019; Wed, 6 Mar 2019
 11:28:56 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>, <sergei.shtylyov@cogentembedded.com>
CC:     <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
        <computersforpeace@gmail.com>, <bbrezillon@kernel.org>,
        <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Topic: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Index: AQHUrcRvVk/NwsnjPU6u4yY8M2eQPqX9XVmAgAFmooA=
Date:   Wed, 6 Mar 2019 11:28:56 +0000
Message-ID: <d19baddf-1409-d92f-4f5b-17a17dfa6fd8@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
 <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
In-Reply-To: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::14) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f70a82a9-5c54-43fe-5af2-08d6a226eb5b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);SRVR:BN6PR11MB0066;
x-ms-traffictypediagnostic: BN6PR11MB0066:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIwMDY2OzIzOmd4d05BR2V1c2FXN1NiblRnREFLQWpDWnlT?=
 =?utf-8?B?K1hsZUFwbUNkcUUvYmI0UW9ITXFyOVFkZHIvbW9kWWhpQ20rc01MSURCT3g3?=
 =?utf-8?B?UGY2Wk92K254MnlkNG9RV0FNVXI0blVQTm10MmptQXg2V29OdDE2eGNncTFV?=
 =?utf-8?B?dnVkaStXbUlSdlBPUktKd0tFOE9FZzUzOXNYUTFYT0t5VStiS3NZZE5wV2hx?=
 =?utf-8?B?dHpxQUttZkwzZXdxQUJ4QjBxRDMrNmNJMm51SDdzYVEzeVBtNW9uK3FBYjZv?=
 =?utf-8?B?eTd6VWtSZFU1a0VRK0ZHVy92enF2ayt1VmdNZkNRalh2T0dYSGs0Sk1LajZm?=
 =?utf-8?B?U2lnZFFsWXNpUTRZeFA0SFArd1BnaldHQ1lIM2xKQWtRT2t4cHZEUXVnS2Ru?=
 =?utf-8?B?US9oOHc1bktRZzZNNC8zdlVFWUU4bnF1azdFamQraWliOEtqZUxLQmNuOHox?=
 =?utf-8?B?SmpOMGNGaW1XbVZvRW16RlRjdmZnaGRndlllaTg2eXBZOERSUkg5TmNLQjVw?=
 =?utf-8?B?YU5aSUV0ZFFmZi9pZnNSQ0RyQk1HdjFQVnp1MFFBYTZnN0tjMnRKdTdLS0Vm?=
 =?utf-8?B?QWYwRnRoMEFwVzFvT2dzZzhoNjQ1dDVXcUhvRHFHd25oN3VaT3lVQmV3TURn?=
 =?utf-8?B?aXZUaW1uaFZTNTlrb1Z1UVROUHlHOWlNT3ZkdXArZzE2OXNUTURWM2hTRzdY?=
 =?utf-8?B?T1pTT1dGbzJlYjN0OGlmZDlWMDIyUXR6RThMQkVnb095QXRvSUoxVWY1U2Ur?=
 =?utf-8?B?R3NoLzFVdktheU9zVDdzZ011c0hCREk2djZRWEROaGQyemJZQTh4TXNRcVM5?=
 =?utf-8?B?bldtRUF4V1hFU2NpbEdCWUxxUUZyNGJFeTlNN1oybjN4VTV0Qy9tUm15NUNo?=
 =?utf-8?B?RU5rS3d2N3AvYkVEeHhTcHE2Q3luOXVSaFlSSEs4N3BBd3l3ZlRKVlNlMjlL?=
 =?utf-8?B?eXFMYkRCY0dZekVWZjYySW5qVGxQM2JTUFl3TU5FdklKVTdTNW5mMHBSa1hk?=
 =?utf-8?B?WXd0My9zSWVWWnY1UWlxQlZ1ZUc0Mko2TVRaNm9uWGR4Z1lkUmp6OGVmdU5T?=
 =?utf-8?B?NktTZ2NqZFd6QXpjTmZHaXVYdWFTbDBiZTFDVFREK2UydWs0elB2OHFKZFV2?=
 =?utf-8?B?eENLZjY1VGJ4R0tpdXE4bVFCRmNKekVmZ0VXd2JaVlpsOXlkZWtxY2Nwd2lv?=
 =?utf-8?B?MElVRWt1Qkp2WUZFajVJZFU4UVlCUTRYS2dZeU9NdTBHS002Z0g5eFk1VzZk?=
 =?utf-8?B?NExLTTE5SVVJUVl2VHFZSHJPdGVKbmZrTFo5TUxVOE1VRzlBYzFFVGNBdnNl?=
 =?utf-8?B?S0R3aHBLVm1qZXlvRDhPQ2E1WmlNaGVockM3RGJzMlNNNkJVRjRvTkZ0bUVq?=
 =?utf-8?B?emdDVEhmSk9CRndIR2RyN0o5UGRsMjZQV29DNmpFZzJscVJDY1RscG91aUov?=
 =?utf-8?B?N0NnTVJ4WHV2WlRKQmtZRWtKZUhpSk9JM1lvR2h5NlJNTEZJMG9PelFmenhi?=
 =?utf-8?B?YTg3UlVtbCt0UzA3VFhGWkZEelJLZlJSZ01yMm40NitRZE9hZlJ4cmRrT2pi?=
 =?utf-8?B?QlF4LzlsUGZhdlVlZEszaTZHV01mSE5kV0hUeTB4c3hvNS9ya2F0ZTd1bVRo?=
 =?utf-8?B?bUdQTk1mZUVUaDFhSnVCTmsyQ2VpZUY1dWwvckFMaGlsV1FLMTQ2MitQZk0x?=
 =?utf-8?B?a2Rlam9qenc1ZVM0VGVIVmw1bHBHRFF3SjcyOXovelNUUTB2UEdkU0x2MXhT?=
 =?utf-8?Q?tH/XjFQ8Z1snR4VFA3B1ij5bk9OQMmZzWEONk=3D?=
x-microsoft-antispam-prvs: <BN6PR11MB0066A658B796E46EB9E6C74CF0730@BN6PR11MB0066.namprd11.prod.outlook.com>
x-forefront-prvs: 0968D37274
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5660300002)(72206003)(7736002)(305945005)(386003)(8936002)(76176011)(6506007)(478600001)(102836004)(54906003)(558084003)(106356001)(105586002)(256004)(52116002)(86362001)(14454004)(31686004)(68736007)(31696002)(186003)(81166006)(81156014)(110136005)(8676002)(97736004)(446003)(11346002)(6436002)(3846002)(66066001)(6116002)(53936002)(99286004)(316002)(71190400001)(6246003)(229853002)(71200400001)(36756003)(6486002)(26005)(4326008)(53546011)(25786009)(486006)(6512007)(476003)(2616005)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB0066;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xn20w7CU9kFKdTgnM3xnM9mBtxubUvI/8Dva5bOM0aI0XwTPGx1zlB9LgytvHPVDjh0wDFL6Ht31zp+doF07qsQQBzMjTocygHXaUrlBqePzMGbQELPOX3Qroza+RRnqntCY8lSrrPqXRY0LsqEEQZNyD6gy8LaeEz5j807RKwc0dbGgAGNO/gzTlwx/oJWCChYxvIpl3dQgJLcguCmf0VSWJTCdkW1oC9kEdAKpTiGfZ+5azFlqiffSHXDRXkbwVip2htNaS4RcRsUMFL7jwRH3+0Z4jBT5zAyBd5Id8zYorQGMQ6EOBTZvaT8Y7xZJITg3LotMBeXVz3Da776bW39cWsJCHOgUofbzyyEZVcFBUNGwhHxA1LUzHo728IUPZBsdKUlTX+flueLNM4lNGbhO+IqNW2+A2G1iToTPFU4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E59020E3C0B29645AA9245DA842FD64B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f70a82a9-5c54-43fe-5af2-08d6a226eb5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2019 11:28:56.3766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0066
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCk9uIDAzLzA1LzIwMTkgMDQ6MDUgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4g
ICAgICttMjVwODAgc3BpMC4wOiB1bnJlY29nbml6ZWQgSkVERUMgaWQgYnl0ZXM6IDAxLCAwMiwg
MjANCg0Kc2lkZSBub3RlOiBmaXJzdCAzIGlkIGJ5dGVzIGFyZSBjb3JyZWN0LCB3ZSBzaG91bGQg
cHJpbnQgYWxsIGlkX2xlbiBieXRlcyBvbiBlcnJvci4NCg==
