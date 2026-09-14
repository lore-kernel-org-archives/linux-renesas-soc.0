Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155782DAFDE;
	Mon, 14 Sep 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376605; cv=fail; b=AW9Q/l+X6iT/GIEI+QeUFGcAyB2FAsa6a7xhLZDm6SS0/m3l6jx7YQMdVq+B26qyF0mk3nRp0z8dHrTO50zD4Cb6SSRcY+Va/F7zy2XgFZWJFs25/mQmAjjn23XLrm055LoTVyXqCzzd6MIM67tj2OlG5cvItYnkHW8ZVRWlqWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376605; c=relaxed/simple;
	bh=pJZoow4UGvQKO1/RrGJdTX1ivC6REOr7QQZkf9YHUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MynSCWYaYYiCE5PZE0c6GPd1D3dPVkn2yp/IseWiHs3dfhq1PCSTKGpIGe6p0Uw81LDi8ikafgVagLez32fkAhQpUN3CT0h1tP4RVP/widgDodhZgALk3c4cq/qshXGWdiTMKhYBBnqMucWt0Ilak1oAEwGvz/njsim2TQiG6uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=P+ow2uH8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XDUQ+z2K; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="P+ow2uH8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XDUQ+z2K"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E4lRrn849027;
	Mon, 14 Sep 2026 04:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=weBWEJvuFR2cH2er63
	VOVqqb6j3fIsTQLuK0WKduTe4=; b=P+ow2uH8d4lHq3I/tv1XrIC/GDKFeEVajq
	MOm5IRD7CXfoUZtiI9hifgriRV3NtjRhGWaxZNrnpzaTm/hPA5f9mDqYBwhpP59S
	ww5WMu7uvIc9EjfLnGbT/+I6H7wAzR/1IhuCyg94zeWh4N/b7TPWYwkD00XWgNSY
	GgBRZqOuvas6sHKvO/P7fRmZ7ZHWqECoS+79XfUEMDKRza5gihcLz/ZJ5Z5z4xLt
	oI+82Mtr7rS5w6AzZ3LuDYcqxpYHfCDxwRczBr4g1OjazqE2g2PRSOEBFWsY1krq
	wxfq1xWs4RR4iMHtdk9IYxH6cXKMLgFXZZwfi9MuU5JwVKQ7w2iQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021087.outbound.protection.outlook.com [40.107.208.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44w9kpj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 04:03:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LryzUvZWswNwLJEZaON00uL5SBPnsHh4owvxEiTAW3Dul2lfDWy4WUN2KUjGtmMPwN9HHrj/uIG17ZQfsYgRQjBSCMhFQDb1NwhGG79Y0uffHTpJotK30d++pQ1ZkbEb03ntFZqChl5AF+J9Mfwu/mygf+za/FJYE+R6bB0Y36JooPCc5GtQ0uzSYdjKxXJabCVeFERMH6hMfnEFXI7vWJKkX/+jbvoUZxOlCylEd1Hf575MPpdjMOU2wjCgwVFTUEDhulpQ9Q0qN9I8XiAsckIzf2Gc5MAguWH8QUe3kUiVyu13AzM5N/IJYcKw0Wf21p3aeDArvkHrAJgwacLE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weBWEJvuFR2cH2er63VOVqqb6j3fIsTQLuK0WKduTe4=;
 b=uBWsV2G1XZgoaSrMqQZ/IvJfXXcaggpba5FZLWLnzjPAYJjOXdpcjxMgAD/jsG9ij/dL6e7nqEVKg0tUPm8RQwyne72cDgiT0myrxmgMScf8TfqAKkhpkr0A/mUSjyO8wFgnyXwU0JQFvZCg8w1mOma1353eAVpW8U3btjHWc5WhqPMiRbPizJyOM4m7z1cJ37WB1ihKZMAN4+sfhOPfIl97OaAT3FuecVEyJhakAoCPDIq0+VPqg6vQIYET0euA1n6bmo6F/7R+bVMeRXuEx3SbeP74dKoptkyAoq9NMRVr6qkT5YVGMlIA8oUaBOi3npyZ6QGnH3al34TFNrZ7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weBWEJvuFR2cH2er63VOVqqb6j3fIsTQLuK0WKduTe4=;
 b=XDUQ+z2KsVW1WnPGnvQJztlOvCwDExBGe8/ZS2bXW1GyJFPRs0BB+QoHPEeXUj3Q/b+THYTLMv1TjU2Jduiw42YPSQVDSYey7IFd2+apf+/g+UYLCF5X1uaqxwbvu5+l4CJSSPtow6vywnpqgtHeXm53JXtpYusV0WGD58yMJik=
Received: from CH2PR02CA0012.namprd02.prod.outlook.com (2603:10b6:610:4e::22)
 by LV0PR19MB9211.namprd19.prod.outlook.com (2603:10b6:408:323::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:03:18 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::40) by CH2PR02CA0012.outlook.office365.com
 (2603:10b6:610:4e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Mon,
 14 Sep 2026 09:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 09:03:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F189240655E;
	Mon, 14 Sep 2026 09:03:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0AB7820247;
	Mon, 14 Sep 2026 09:03:16 +0000 (UTC)
Date: Mon, 14 Sep 2026 10:03:15 +0100
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
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
Message-ID: <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|LV0PR19MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: d16866ed-f84d-488d-9cc7-08df123f04f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|23010399003|82310400026|11063799006|56012099006|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/m9m9tcG3XQsZs9JnwColHj22ZP+WwICsZC3TP1HjU5n9PfCp8nqlFz4jj59qECgF/YMzm94M/zMRfqrOMRFYNdc3bvhBJSSqTY7FlrvLeJebMVkuI3KTMARB5+MMjvWXBI5QgYeCRhSpFfXWpe0TB8j8wfuYrPpxJbIjgFJtpc5C0vWymGxKkDxc9l/ejXlVeh12o8f2+ExJ1VgnBAqFhbBv9dkntzgkiqcJANN2KpMe+GGyLQ4GvQ8x6BO4wxM91uMUUbYM3rSobfU9WjI1aLXC3k3wFrLye8PN+p8am1bnquofbVnbFA1aJfuT9ksczl8CA4PYDxuTsh/65FxA5/6mVxCnAIF2EILPsSHnx7zBIrqdZmTazTqONsnx3XLvJYivJMeTVhKFh0EVABLv5bJnqH5Zh3gcYPJbv22uMPXM4fEdHbXISlCt6q/QgxFYH96HpQ1WoWBoyCnqPOjHHX3CKrkLvvR1PxM4KJoWSYgZAOicNVgk2HWIvbGi/z2DPG60tk6kEYmG1hB+ET3jY+RTdwpsV9IFP9zfouuIErGTvKqMu7YkccuiAiPAUUflWg4IQ5nz0n+VbjnWZT8zVKg+JBVSVwrGj7TFofw5NHKczFXPhujqf9JjKr7c5uepyoXZYXXzf/s/yPWQpoW2XUEciAJBSJYjO+Yw1Ucl1pgDlUat0XU04qOVr5JFHS2ChyAkSNbvFz3/MKeGu0rOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d1FOpyIWXZj/GqZS/5OUC9TKGa0qLQ43dxUGHF+xkry+UBM2kqMETD9z0y6V3kMiYa9csGGIWUnQ8vQq1D5qJGMJXmBTXBKmhSdrxx36tsrBWtVaqerRIcoe2muHD3uB4bIB0vKI36A99qMlup91/VxiOjuR0ykcM4Qmtl31jsBMDN9onqtnnmvnjYSqrQHQQ36Zzutg1JKL02QsyhpmyQ2UblpYniHiYe5IL0Dmw1IG7ADq2z57oHXLblGiSMG7nrl8H5KqKghzPGXcCgcpQhgCMYKObCdPkVUOE+B3kK7tN6+unwH8xI6zbC3qRLrDnu8SXeAKnt0+Ng9aICwGAIho/uTbqrL5++l0LY5I+me26XeOOb208LzIeslkRrI73K7fk3CqCy/tBL7PV7ecQwpLGq5SHb3DgGmfpuZljLDhA9QkpvVEOnMr2K0RSSj0
X-Exchange-RoutingPolicyChecked:
	wiCXa9BIk6/LZ9/dRGdrBVkJ8UbLBfL3GCQQip+Dkd3IdUnygswJh85DCyAok5buDNT6mNQuxYrpC31xHqjSIY0KG4nHmFDY+CZ1CMo4txhvPLicSUsyK007dQrL5p1WOLCnfh8HqjAOX5BXoOIeWq9X5au4h4zTlPEW4xCS4w0HWqkAZGL1kTuLJBhe1qjp3DZfrypaUuq/f8sMQL3pEl7UziZ02eAdwuW45QdUBjB1NA8va+vSBow/NU3gwvIsPAFUZIOxM83LMX/6oBEaCkFYW1tjC4yqhqkOcYlEicRSjD7cdo+bXCwW/c0/gV3P+Izxi4jan9zyKkr+rvdr0g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:03:18.3249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d16866ed-f84d-488d-9cc7-08df123f04f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9211
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa7b85a cx=c_pps
 a=eOWwnDVbUqOPKsrteEnlPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX8cbKUBC+IDRx
 jdearuV4SpAj33DU9A0lYuguJgcKifvey4bahFt46k4S5A8Md/yneBnzB+hQxA6UxjNOSLwynlm
 9BncF/pqbt6BRxYCsjhTDQCSFcf6vyQNuqylWZZhVDVUMipANckeygZwdbG6doDW6rbN46g32Nl
 qnGp8llHI4BQQNCdw68LgeH0gLvrzU8Vtg62OnQgBdWHpez3nZewmu4EXX2A+qI3AjAwVBluOGN
 W9nRG71ydgA9kN4q1e9wtf0yP+KJE7FyZgGg8B4hrCdXqQSORZnHIgyJJje1I7LQbx4ltiKw6tq
 t1ANl8zV/mmYu3GUFZ0IjF9+a1GvSw8aU0ih/yH7KbBmxiIgf9cUI6o9NmPjuKewbK2ibpEqf5I
 hmYeMdApkVzi3C2vsHz1J4td3ghPkl4svua358+O9SIUkimV1pSmQcr1fngxBYyI9HSAdjFAuvq
 2i0ii1eB/SmlSrSwCvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfXyrd8pIDFG5px
 ExPEZCJ03b6kRv1JEdTAPTiQclyUp5+xMn04uSVeWYpb9P2rj1wy9Azoq16lNyK5WX7hvo09On1
 asgB/9Q/U0OmAY4qXlGBhVzxJFVVSWA=
X-Proofpoint-ORIG-GUID: cb9khDtqqb3JCz4wELBqnxyqlxIYBx0x
X-Proofpoint-GUID: cb9khDtqqb3JCz4wELBqnxyqlxIYBx0x
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 13, 2026 at 02:32:35PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> While changing the lines, correct also node name to be generic in
> dialog,da7219.yaml.

And cs42l42 which you also fixup, would make sense to fixup
cs35l45 which also has a non-generic name and isn't fixed up.

Thanks,
Charles
