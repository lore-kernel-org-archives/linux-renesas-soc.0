Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DEB410D1A;
	Mon,  3 Aug 2026 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763760; cv=fail; b=i0iNTFTHbjVDdOX785u7qC3SwitX7+HgDtNJ+rxrQwcOc3YGYdtmhtKT1BGXpGMyHli6oVdBRNZYVLf5hWlMaiYm9FqUjUnbPLadFv+6i72ohKNh/GIWMjA3q2Rq22PIn4aR/b5iot/zaMyhsDrDJYPyN+xt22cDo1h8Tsm7nmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763760; c=relaxed/simple;
	bh=Y/KdKmWc3c9sM9OimH6BwOHAJtajAtXSufKnQY1RAlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bx1j0YZ2HYnuy6t3KROKMiG4Hbxc3TeFOOtKUEX7ZVwAal3veKbJo+gsqFz4ich/yBUVy1begS2YNKh5MbMleMCz51B7DwN/G82CaPvtNM+UPIKrP9wRP3FsEf7aKXIR42DagNvby5xMdqoTwDeFSufS7oh2pMo8KF4I90S93Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JW6RC1/V; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JW6RC1/V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8oI9FFUTAHcwxP/O8gQNoYVr/ZF/CmxrgK+H1TrX1VJ5e7aNwSZ8evcHQ1ctXD0AstT4fpvykPB9R64ipXts7Ez52E9dcF0A+Rr9mcN2WtFaxPKXXY4qGq9JKx0tqZ3L9AuFmKglTQhmcpTqaP4m6ue3TaTYls+oNd+hR4UnoIQEikPY2GODoPKz7Ji6v7wMVoo8KtU4baBdbTxc1yRFz+w0pseOJFG8zUwK9RfQhkDotli6Ht9tZhOLgh62F2vbKrakPDN5dcxWZxhFm6VWZmw6UBb5edZxX6eqQPMfyjoZKYbEvg0jTJxG9+UQZHkrcA1yKXqkTcKV9Sybx65Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXJdN1vg/n8bX4tyS1UHLOa70Ih8tzkQ0Sdd0lKa8qA=;
 b=xpb6Ac9C0nXET1xBEGDS4yXuKCxw0T1UR1avN7kzj1ujO/a3ZOYnjcmRkoFbSxUssqLFcvVnS4xUjiaQSkDd+L47VOCAaTPkma27OAQ8IlN4EzJpldUcu011L+Ku32enbGWMa67QPYHrNlcD9qxUFsmRxuLrEmwIP/iAVB3FvgfSGFNnwXnXB5KrhocWmkpe1Sdahs8vWCVOV6OKsn2h8dw3BsCi4z5w0GQCGIm0XUS0gHCOzddFPWMFOuFpsUcBughYR0j4XVGb5L7C1JksAJkwTK+X6scSe19WvIspygD/NEsAVT99AKOQXSf9gOMJYoFKkIVz/VzQL7BXie494Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXJdN1vg/n8bX4tyS1UHLOa70Ih8tzkQ0Sdd0lKa8qA=;
 b=JW6RC1/V5sF/1okSjhRNGn+a5/gKdWwMP+VA3V6a/d1oYkGIwkdprtinI+j/DN+bcVcuCnYwGKCV+dhbF5bhDju6rPbFhZ8/bBw7uAu5VpOV5V9tuKicGZV7FmtZcM5+SAb2lKY9d1k2xpodMBfxspunBEKFVBVXMnDZbSHMZMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY4PR01MB17923.jpnprd01.prod.outlook.com (2603:1096:405:34a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:29:08 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 13:29:08 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1 clock frequency to 1 MHz
Date: Mon,  3 Aug 2026 15:28:26 +0200
Message-ID: <20260803132828.3249424-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY4PR01MB17923:EE_
X-MS-Office365-Filtering-Correlation-Id: 263bbbbf-b11b-469f-9ee6-08def1633229
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|38350700014|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/b03GyUE2T16ojShNpAwrenvw1qSHnhcLGvL/e72f4u2IiZJ9CSkIKxzqr2L9Cp8idsMjaNCg728Bzf0jlhgjpBK6TcWnMeV+RAUfUI7/5CXFyGAGHl+AriiZ+3OTntVsGE0zq+0hl3YAjafE+Z++8YV1fZzzkb1Ome7Mp6gSArPhiDCsb9YnwsheBQeJkCLqrUXpZk1BNQDytEYVaVMYSYYdh1wdNFg04kt7mnCpVlZekwF4ChqMH4X5klhf57bVNsqJ5V0s53rfhl0aCFtOaBqH6VAfDNSJdo1qdK5xt5cbQXpIKehVvM34pofVYph/ZvVvJ4naDPL3FAPCHdCMkCJ8AolTnQpD5RmnZt6u8Rgl/g8JJNL7Q3k1YNlsZ4iNFHbljlCH1jJ1M89QXLSXNjHsg6ispZkiS84/pkl2kZr11kyxsjmXmZnnkBkDuf1r3hZDxcnNMEXA3BGLBKRlUhnoezQAOuWgr1GrnbJiemraNjV99cabvlzRQgT4aXLHD8xBYV35KsGLduXEx5MmRIzoVqeWyxEnZ9VGlzBTFJ0/04Hst/fnSyK87q0e+0eZ5Y1ypqTLZ7+nfPFrArvbroXR4Idvexg+KEGj46YrAyjCFQZxWnfJ+xhpL74AlRybfCI8L3Tisb/joZCDfHwv9dH+Benh0WPumES2+Fpo/V3EPJExlyJnqHgHccyOAtmq2yXjo4wV+v9PCceHnqUmbHzvjmL3e6ts2dn/HNBqzg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38350700014)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V29Hn8vSqrSMsAveZuEfUR6/QIcDkqGhSNFkWDquQR3/NKThksyxamKIBSwo?=
 =?us-ascii?Q?azxafO/FCfDL87GVQUAdeW62HMh+CsaYZ6c08rK4NP2QlxwIJzGn4K+hBTHM?=
 =?us-ascii?Q?vnFKyKZKiqFGM1FBhUOmjOXGMT9QKcw+cUVf3qaW+m5ltBbaxcvnF/aA0jfQ?=
 =?us-ascii?Q?H8D2QsNB518/qM8SlSjIfEYIuxucqpNCAHLSUyHmqcf0rBmN0p9s2U38dF4M?=
 =?us-ascii?Q?oS78YVMVc5LcMknDYG0WaVgvXWHLhVeJyqi+LSnsK+BJy5G4R4B4nBctAHVT?=
 =?us-ascii?Q?iRe5uyI35d5lGsav0UOXQD7k68r4wKbt7hLupQVXw8UE+bUk+HTJhqfEMvLY?=
 =?us-ascii?Q?fwMTvwKP44xsD5C/JZYEav3y7PvgB0B8+8pGszl9tUKiSIo8ssE1Wef4xR6P?=
 =?us-ascii?Q?TkLXWX1jDz5CVtgw4fS5l6W+dvZsTDMjYDLH/yi7duUpOPY1/uXlyHOubm7+?=
 =?us-ascii?Q?EqSJX33BIm515L5Ymi7voGjGtfVAiBnMSV7g86iCRHkd7NcBqpnmMxcaA1Gj?=
 =?us-ascii?Q?Rv3ZTtFhRMf7d1qPsQivePbbZzaxEuE3xsscAz63b0Z0wLWHyHmvfpqF/j7R?=
 =?us-ascii?Q?IwCzUG8Yrq8VOhllarB6/Pht7gxLlmjRMG2VgyGB51M3YLZgdeRTuNuUZWOh?=
 =?us-ascii?Q?nugX/edJyuagUGRxAe6bV53o5DBFHQBls+I+gjjCZEv/iHWVhqetlqB4bEL6?=
 =?us-ascii?Q?HNsekML3rBKIsZTl3wIayd2tczm4oo2uDhLHmND1TFuKOrwa8gzN609VlVbH?=
 =?us-ascii?Q?cjRvGt0K92iQ1nsVwly9YLcsfIPWxNbje7kUmt/hQYw8kllQyC1hY3qXYf90?=
 =?us-ascii?Q?LLO/ASUbkGH0brkFjko53UcgrnnjC39AGPJZVUC0uM/0iKmwflJaLn6ql8q+?=
 =?us-ascii?Q?Js00c3TJj5E6XPbSGhC5WO/b4Gsadz9/vrIlTr+q0RBM9/bLLgCJNawNdJP8?=
 =?us-ascii?Q?aUE5muNksnlZigCmkWhwlQ+sxMRp7BEbq7Og5KgtdbNPsqrwXnuptRkxEo0b?=
 =?us-ascii?Q?BPEOfapUB/R9/Gcecek9p2WGAlSqPwtlgxLiY3mHNpowLQdRbQjhvhP9joqO?=
 =?us-ascii?Q?w0clL0jrzNTl9cAXi8XZUJmjZVjDtGLudVB/oqzkE0RJbkkpwWVsq5yGm32o?=
 =?us-ascii?Q?ezFpo1CCLgODJj+/0mly4ZBdVxJo4M7TYmOOh1V75SOHELgypcX4gGJWszLS?=
 =?us-ascii?Q?3Gg849+ZCNDhctXkMs/N8z9saaPLjZSR2AchVFjJYQkA6Ee88JLzg7hFv0k8?=
 =?us-ascii?Q?fFcSgLtRpfYzcCIxKJuWmfjD4X9hZM3N0la4HDNBn/GAOZJ7nuncy9FGf91X?=
 =?us-ascii?Q?sCZ94QCWyEYTxabJ9XguKW3B0EWEcnLwqllE6hM0pjdV0bqvpA1pEueNS1zO?=
 =?us-ascii?Q?mReA/k+naxEUgWk9CdqMYaxZ2RL0LgUAqpYPk4A7Ewm6DfKPVAQ4JVDufjz4?=
 =?us-ascii?Q?qR+bWEHycDdl4Yg4+HCcITRceT07aCB1HoFtJbcByuQ8L8WZA5L1RwOiqTIL?=
 =?us-ascii?Q?YGEPuJc1l3D7cfF1oAj/USok8nPKepI2BKD84mP+CIR/vwbq5zTWrWnkeyHj?=
 =?us-ascii?Q?kgKsgd/yGmRZwX0It6cl/sn7hySttGTZcGH5w6ezyqCH8nCYA3w3KtCznu5X?=
 =?us-ascii?Q?LgFdnuK3hGJ64X+Am32M496YAQHpARb1vIkpGhgmXNMX/bqkGENLoHNMrki3?=
 =?us-ascii?Q?WFF+Nau/e1ypsPh19eaUBg2o2r51VUYXzjNh3gX2n2kX4JcehBv4rf5P1Bay?=
 =?us-ascii?Q?0Wc/IinQc0cTzoRCv5KFvA2b0SlGJkH2RQ7ObSHbvttVgKmcjvK/?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263bbbbf-b11b-469f-9ee6-08def1633229
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:29:08.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zr5EoWcLW3enTYxsIXXEmbR87uMpHXD2qIyAOcfB+3KaS8rVVcmlaZdhVLw4AqSv6gynKvsUGOiLanoJKLAuHWqSUvLNyGNxSBLiCGYPrGv+K/ERiRq0ZAN6WRfZDcdo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17923

On the SMARC carrier board I2C1 only carries the DA7212 audio codec.
Override the 100 kHz SoC default with 1 MHz.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 4eed095b683b..469a6282b2a3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -147,6 +147,8 @@ &i2c0 {
 };
 
 &i2c1 {
+	clock-frequency = <1000000>;
+
 	da7212: codec@1a {
 		compatible = "dlg,da7212";
 		#sound-dai-cells = <0>;
-- 
2.54.0

