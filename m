Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83326421255;
	Mon, 14 Sep 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379319; cv=fail; b=XsgGNAExnvo5DKI6zog7MjSbAjCTze1RhgAWSfnwKWe2pSS/x7ntKv1JWx6GBBdvXFq6IBzg0M0MCSAoxRVHyyUULnvzhI/aTFv7r14pmRwWku4x4N4SumNrsf7tRueokL6UeymtYTmS2Bw/WigYEsXgQvG2QVIrrKQdE8GEars=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379319; c=relaxed/simple;
	bh=n0RPLOqr26OexMpFWsFbodeGHW/R4DBSTjst4IfWz98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nm8CQu8/Lkxsc2uYL5qTbMj2N4qNlmZsdLOELeKBuB5G4vF95IlmQtNbmqvn3pEZZP1hjhD/aCc9jgG9SV3wo5C78dQPWlNWkLR5p2Fk7tZBIm/Wm1u3aQpROr4vn5FHLrj4MCwonERh5WoFbgbWJ9jkC9Dek8kq9BpbgwPTKug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UOATDsdG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yKkvu0e5; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UOATDsdG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yKkvu0e5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E49BwY786064;
	Mon, 14 Sep 2026 04:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=h82E/DRJ/UndDq0YDl
	ZZ7LIyPWDAo9HOTpFdvZtaIuQ=; b=UOATDsdGwJZL64woNtU8G0ExRqZRrpi90b
	RxRTXFeaR5Oo7Is8cCoJbant+vzLE3E9c933psPor9jtRifFTF1PVVczKbGM6EaM
	mKNKZDdxNeYJII0dgmDFs9LARfztBGub7de1hqy/210hAs31/ZYhiFR5erSCa1wT
	0rSa7e/lDhpYvkgHU0iO5dyIVSoYI5YDQxtY4lqfHB5XE3AFajIYEJJOmqL7J9I4
	n1N8BQnkukIBQqppqJLxa8umVr/dZokqcN3cTwTse/fRReaC3qctj3Q6RWVEcPyO
	i/EAryMA+Qs9WBAzbnvVXcYcz9n9SDcwlhsZfulEKQQhobKW1VUA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020139.outbound.protection.outlook.com [52.101.193.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44w9n89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 04:48:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJuGrZRnAhcMTyFX8TId6gROoI0feVSc2jvMjs2DMcBirhnnJvz/FbdQMBQL5X91bOM+Y2rx5NvzUL5MvNNH0mFL8xNmEEQtGHPZrPdtl0T6c2Lt4hxvCTL9/7PyDekLwH47noIgSaqjnTJO0XX6Ae6zWwYhLNNPXs+MDL4gj9xPfH6i5hc/VNrPnBuJ/5bY2dDQ6YJOLN5ia30nFR+KaXR0SV9+8QhMcfhgV3yl6g1u5sM6HQM1DEWoko94ZOzdVYlzKDqXMe7rmwYwusxi8vzPQg0YAMA5vjxMpe7mfGtdy84Z5LCNBV5LC/u1jYl/1+DmfKdeMLQnU5fXaCdzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h82E/DRJ/UndDq0YDlZZ7LIyPWDAo9HOTpFdvZtaIuQ=;
 b=Sx8jzZCUggIGJRxVw/UgcOTf0r3WHr6Wf2T5OS/h+Rn9q+EBD2vhK1gx51Alv+3V1ugDKEft3/LYQyQNGrd4oOKHOd0RlqPYqQnIYKYChDuecOgaPYGrWwykexsLsnl3uQ46z/wHNE2wIHCaAAgFAFqjolG+Dm/55TqTJ01Bm1raHUIKf74Tfrj+OxLBuKVYyDUxjXyr/2LESdRszYxv95ANe8QaeLAVLBvAfSVUvbAueYaRqMIAj1y1LQYN+wQDuj1olyXI29zS3yB8qC5Pvgcx/JyXB6ViW7ZPkjUfO5W1oYO9h0NRXHb8nKESXZJo0fADVWNS6imv+MXSffzfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h82E/DRJ/UndDq0YDlZZ7LIyPWDAo9HOTpFdvZtaIuQ=;
 b=yKkvu0e58lSjyk9CczUKxucFIv1aJyWxZDRq2+TseIGM7RjOd/VIF5+QY2h816BDHKyNdkQE6irr5xhmi4O0yYRXWiLnMfGBxSRD3zO1zAM6Nf5Gj/ykQAo2OM0q6bKFUc1X6f0TORXub9XcbiFesHuK45Zuy2qWOroWLc6W1Po=
Received: from SJ0PR03CA0252.namprd03.prod.outlook.com (2603:10b6:a03:3a0::17)
 by LV2PR19MB5864.namprd19.prod.outlook.com (2603:10b6:408:172::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:48:32 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::16) by SJ0PR03CA0252.outlook.office365.com
 (2603:10b6:a03:3a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 09:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 09:48:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B506340655E;
	Mon, 14 Sep 2026 09:48:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 90677820247;
	Mon, 14 Sep 2026 09:48:28 +0000 (UTC)
Date: Mon, 14 Sep 2026 10:48:27 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
Message-ID: <aqfC6xt3QoO5Apvy@opensource.cirrus.com>
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|LV2PR19MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: d9867f95-51cf-4e78-9282-08df1245559a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|61400799027|16102099003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	AvNWxvmMG4WqczqvyhxX83b9zxKpRXwpEuESMB0mvbdgUr3WGRxx5XdU+Lv0uwvCypt7ZUb6BGyax+pfgAzSQjik1p6NDBb0wjnRVTeu7X7suWMgwHx1MA/myAdEFZGqq+JfGElAkNuMqxnUH91fzWCpvF/I1ssuXp1kaKUQ+sCByZyPSFsQQ5ngGgEY4GBq4+kXesjkIuyTHUByrYsv69nvTygu89pBOMLyAQQfJeI4y5YqabzS1WCj3KIDcuKXnmjFMwhWf4Ght0p+aNNwxuto00IQyiUPJVds7/4Bo0rq3HbbUi8KIwOr2uXcTdbF9JtHurjJx1AWq6Gk7Lxw8BmgzHPGhnDGvyZ/0hBx7j78CKTCqpYnxYINfmXJYhGPXW++dxLtTZ8GEjCjuCMFJb4PCyWaQUmgM5Fw8V9+WqEU3bwBgIHHBkQ4Dne1+0wENDjkbFN4huUjU4HHshKITeoZ2t/9ybTpeGANWGAvCg8kRwOIwYf4cp5VcGwlg7lOKdDFNzuh4w7XntvnW/CxXvnQzurNvqQVw4LkTCs2Bzv8HD6vRL8DOAhxSmhFVji6Q6ay7wGtUfG0DahSZ4jj7J4HysigVFk9uTj73DHGNB8+q4gx2A/Vhh+7eTBtSFgY46d9RKr53qc90bTHcvaD16/UJVbzZZYN+q9wlEEy3SgdKfmqJZPLE7XEMyzdbCknAPE55sePMu7y2rt+CT2pSg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(61400799027)(16102099003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qlXfaMMHTEHRlVRG42A5FC44FYNDJMTBZ+6HlqvsM52iSEOTlJPy+I1OnNS9vYsTU62YXZNYrQUjXXA7/luxpR6YSCzZUijrsrVpCKwglB/FaCVUARqj0l8AlsZqfsB4cxnlI/NbpBsMd/pjxHsSzBjIDpMZ87EqwHS2rGljq3EcG4fA3Kw+5uUi5bW+S7DXTBCqNf62Rm5NjxviSygP9GTwUNwdEbacc8E+BqiXCRTwlqyqsbFuo2IHXBSvzpnhm/tzAQXXcmtUn/FL4JqstjIncFgdRVARoP77LK/aSykRorGDnQGmybX0vOiL1XB6gpZfXCyJ0yq0zEdpXdSmgnhofPYVmqw/2+9Kl9kuiabmuXMUP+RgRuQzPll1lR2opgf59Mt4i9kT1xXPSwdDgsAlOkBScJAwAwEMZS7QAeV044RtEKGTrBWs1BrPFvxi
X-Exchange-RoutingPolicyChecked:
	RizOGQH/d250tGiI4FolNXcLRBkXKPGGAwPVSSZD4Hi0bZMThDAfWadjDtXB4b1rquM9rmoLUVCzbQFXNyBwx1TOSUdgYOOwHox5hbnU7LHKdhx19EYQR3MFBueW7LZIOn6K/9YLrLA3qM4olsn2pUeeT9mOxI4mo8TVBA9uQz/PPa0A1Ij9xkpUTz+fApPjBtezXRPZyCTG8R/cZU08naSRaya58OqKqa/Uui2l7rSXrFQRQGadS8TWBxtJOYf80Sj4zIERC1b+TQB8ptMzdgAm7xlyf/m+DLf0bn9Bc8M1Rbiyv+cnQwTmYozJXqiTr00LrmB4y0KqIUAmHKRWLw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:48:30.4896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9867f95-51cf-4e78-9282-08df1245559a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5864
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa7c2f5 cx=c_pps
 a=ZnxqtMyj/3bgKGCG9NJA9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzOSBTYWx0ZWRfX4gGYELK2AEnb
 +/UBlmjmgP2T9J3LF7CUsYUwCPtraQlkwuPMxogTZrgN+Pd08VQbDgitXn0vf8j0pqxyQ7/8Vh6
 WIFQ7oLhMfmYeXtUtqgZ8GNZI0zPs2WQzgotJy9v4nGHkSU3B1qLgix+Y2JJe4lVCbAq13fj6Uw
 HzDkf+ld2/lrZy6k9ydnkJr9m6k+gh4FFgHsk4Q0EGs8uC2VZzWW115GmPk2ZoKgU5F30MLpRAa
 qlNhiRR2CGHKZJWHguSngoswSFXPmreOgc4LMZGWBt0MRvdhmce/heE7BDdZnRR7bhSfBpQSCox
 obawxCGSHA0/shkFhZgpn2sUydhWl9RWNiPYZ+cGT+hbSC++JN5bmdg0jrP/DHbpn70F4WbHQC2
 S2OZH/b8uE1cKN28BKiyt8SXhDJVxpOjlqXBR5Mr9YR7qeB0dxOmYg3W3uXrhYqyTlkOgw1pJWU
 jGNZSKNpsz4NzPb25/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzOSBTYWx0ZWRfX/eovZ1KfEErC
 idIuVdfIkLEt0l5jznUhMVGRxl/u+A4Oa5hWRZsJ+7swA4uiNhdNwwNXTOHKum9xtQbstuvsG3b
 dunQOYz7Yd3f/DaWtObkyKiksimpZ/I=
X-Proofpoint-ORIG-GUID: IatOg-c7F_BjErEltHt7MrBI1nnJJytL
X-Proofpoint-GUID: IatOg-c7F_BjErEltHt7MrBI1nnJJytL
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> While changing the lines, correct also node name to be generic in
> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
