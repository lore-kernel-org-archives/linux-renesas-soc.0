Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CA337E2E6;
	Tue, 18 Aug 2026 14:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063375; cv=fail; b=laiyA/RtK6FBemB4Lss/g+bm/VaJFTgfq49KFV1q2A9jC9kCLL4khY5vCBVBwxc6WlP/UWuERMescH12dDr2jFTdpDOTO6LAoVVzQSBkkuX9hg9FZiTnI9RzN4gEl5+V9u0lmZLTHrr9b8zOiO51UOQjXzGBYgAPwaAyGWHGiRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063375; c=relaxed/simple;
	bh=XleOx4PPF0I+zoltcEOrC+SJUu6a0OEW2ie2KxJMpIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iXNbLyQFBKEnjFNHGBsEhIFD/OnsqVE3/O+agP3wpDfNDmJN/gd/E/NEBBOJHbNCy14TSpvx+TxIKpwGKUXW25ZyjyAHmN0R7x5+0oOPOimv+99Zcb7Kaf7Rz0cad5ZL+xM/gnN3QCo8L/k5dyl6MkacbXGM8kBcAaKmJjN3J/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X06hdTyZ; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X06hdTyZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWbWExWUhfk2LcZo67zgGit/hWFwYqosXxkRQdz1bb9GhNSJUO+GZafB6njNLBMNWHNwHMXQuHdhPEcF15ZilVZbhWmklmBnJ0aLc0JeM8hWCWZ1uc4g3IrA/3RBbQqb03JXLgCT5iNx+vrqVk1vSAK8Irik4sFyeXM7H3FR2RjolnXL25dkYW7rtR1XGrhZDdL/oMzFqoEq98tNQKcF0eQ+Qqw+DKdjLx5lk9DXyJ+RV+lvNUterKd9TBRX78+o+L4R+dp9TDir8LKthWijCyhaSKpOLTYnfUrskqZVDS0hqyZNVNsrBY21moCd7W1WTH1ar7+rkhe6IaLoFVRqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJEYcGry2DENunjqLdUJp+Y0ZtzLIIZuPB2zch36bHg=;
 b=mpfas+DvNWf4FG7TdBIHg+euU3FkccJTkwXsO0Q+mwp1XgC000E2ToiBIUCsnmkBzIGunoqlb7qT538thn5opkmMdqPGjgZ5hUYpIsBzo0Pa6/g6BzM+y8WLp45oHFcrZZt9auNOhg5vc+Gei1QMWmeljGMrNxiBE0AACJp1SAXb1VdBSZ5cQ7oVayHtxwfQEQfUeivqyAiaa3/wyiNOQ23IY8rFGwvh5ABNF6H61xacbIkDfkEN0kexfg+5j90BK0WJnCvsUOBN4wJQnmQpd/dW6DTQJhMvhcYJ+8/dK7wgyccAjKyDgXIjxj2xAzN7LWU/ynhm3aELfQ8Ie5Bc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJEYcGry2DENunjqLdUJp+Y0ZtzLIIZuPB2zch36bHg=;
 b=X06hdTyZsfFDazS6Tt4MYRjfOZSEu57OZuFwyUpTGagtLmNKdQEX4uRQjbHj0+6Za/T+EWzWUuAabe88BUX78fOxyBMvkB7HmuK6PsFgcyHG2AALlnHTyriMZHf/tzA3266hcAjHApOevkbf4D8gGgfSK8R8j0FpdvG5dgo2Dws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB17734.jpnprd01.prod.outlook.com (2603:1096:604:460::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:29:31 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:29:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes
Date: Tue, 18 Aug 2026 16:28:59 +0200
Message-ID: <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS7PR01MB17734:EE_
X-MS-Office365-Filtering-Correlation-Id: c649fe61-c750-46a6-bd54-08defd351e38
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZlKNodoTGa/eKLrz3VkiszSe0PrMN+w3xKXv67t8W8yK9UDn02T7A5YVHXCM4jBn4jmSrGDr5JrCJevW1vdHpGYVnulfiPSsoqQENkmL2XdsaqJB7iZw4CqfKeiPm+LCueroMDvCrL67SXAYQyHHm8w0omU/vXlYOr9ZqQDAdwVKhB9kyTkUcnbuxcozGXGKmWOX5sfQB+CVhaEQfG6FJzTwuJvqoHo/Btuxfn5N//2EQUA4VfmFZzvUBHLZG3GlDvxL4pl+WpcfICrTDkrXb299uPX3jLtU66H4vO97im6RV4D8A997FBrpvr4WbZPZ8FfEnZrQrjAY38pNc9gN+HrNal9o52GLL+o6xmJhHv+jiOWvKjGjZCUCSIfKSUYGqDcr5oSI4pKz1JhgNeqPHaEUp0BT8NG1aKe1vITKbsdH8oBAxLyEnAgEKKBuxf8MGmln4CxKtTcxK05CzXvmNXBMqg+ZHkQkJXeh74k4x6TWbx9wIdqlqdPf9KoJo4pQeTsvu3T4Lsjeia56ak4jg/Ao+TBTFRJIlTCoEDIvo8peki2wxLQiTzYa67SZDkknFdLd8AU4EK0uA82PmxAPinYp7NOjnf+lRh5cA7IAARtV/uV1jEpcIF1MA9nvgSLgIBrJfIjXwqUYBjR7UPES1Ng6uSuntyouG1JrpLLMrPWChljv0Dz2GEjpf5nZISj2psQn/7K9sgnLBXLPcHX8EXYW96/e2DEbtV70XPwFKws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+iTPbZ4j4/5gy2JUBypYJiVP0tHBPYiCo7oNhYwAwgcSrw45QJJUlIvNGf+9?=
 =?us-ascii?Q?i5Rfa+ARtkD/CTo+loo4+NlobuvP/GVNj3AdxXMhb+kaFa4hT5CDGcqtuKAD?=
 =?us-ascii?Q?60P4nhYiVNudeImvha4sD+C9DynbK2jv0dwna2nmSrsmecfZyDnUsR6nCqqo?=
 =?us-ascii?Q?bqaLEf1huXnEZHPl0v9L7CLsbTuufQUsk0EscEYxasK0pKMM4xfTSF35W2mk?=
 =?us-ascii?Q?Ex+LtBtyEJvsSoJM3wi0tt3FgFwYJTQEKbmNQA1vMDc0VcICl+/idtmkBxPZ?=
 =?us-ascii?Q?5+LnKVo9psAnjtcM+RNLOO4lpQpgVijEt8WBaZqlAcQkNCfdxc3ND/9zJQBY?=
 =?us-ascii?Q?7I5Nc5/7N5yMGOXJI75dv9adwxGpfMzJE6YwwBgVWe4riPexwSfxE69kmFCj?=
 =?us-ascii?Q?N1ujRUV5Js96B3EpOE2IsLeltMobqq04Vg6NqsNv0DAwAz6qy6rD775jO1W8?=
 =?us-ascii?Q?e00KmebEMqgkFpF/MbQuGjKR4rNxxTG+5dxBrms+x1UQbyw0tOsckH6JBOHL?=
 =?us-ascii?Q?MEn/jaNd6HlK44QQQaRQXaYHulNeUm6KcyJzOLYIffGgJlkbPycnnESdfKhD?=
 =?us-ascii?Q?aEhp2hTS1TeQ9lQbmmCshXhkIGWDrsk85py1WzCab9+DcA/JyLDZHNFM7lum?=
 =?us-ascii?Q?JG//U0bX8RmaTB8O+dHeBYngWVUe+M8pBuBqRs3g/2/N/0XmUUrkSf3m8lzN?=
 =?us-ascii?Q?AaOlNif9ASSxy/kY6aaf54oIqkQGAQqx5PjvXpsgrL2yRNprPcX7I29HzyKd?=
 =?us-ascii?Q?M2xsIvJHiPq2kO0GD99U7XdHnsWflimsSZuIAtqt6IoxpoET7IbnKWT5J5vS?=
 =?us-ascii?Q?Il7g7sU/4AhORmqISKKzQIdD6vG0bf/hQzbFmgmdm73NTR00T+vqpPqXm9Jl?=
 =?us-ascii?Q?KeVzo01XCdW/LLA84zvZC+kNx1ZjQsBDlQBVViEHVNbrgbYHhfWp5j3AC1G/?=
 =?us-ascii?Q?RhF4tIn61iR1mNE3oMUrRWLu7189YBFoX/cnKcmrvSpJQMF7oGlbJyavf1Z2?=
 =?us-ascii?Q?ZDBhDUO8ha9VuAaRl6qITWNXGEYQhDkhxcs9Hvrw6MdoQZUqjPe0fkAYB+n6?=
 =?us-ascii?Q?OVKo/SyY/X2jWCnHkL/B4y93dM+oG/D10qwvoHv9nu1j/E7YR2pRWYUGr2TF?=
 =?us-ascii?Q?94pfUF4o3T1fSuEHfEgc5WcKTWl99fn/Nis8RqGPqKoOC5inFlQU3Z2E94YO?=
 =?us-ascii?Q?hl7/9Z45bSB0b5q1sc9XUDChqWf2avf9sQQbHBUHIxVIlS4XC9u4F0fcEiCm?=
 =?us-ascii?Q?cK9pyHwC9Cyu6b/gGdt5wz6cdHhVIVXCbVwNnAE1IVCMN8Vqe+Gu/MBsjFrH?=
 =?us-ascii?Q?WeL9lKSrFOoc/aVxUMHUNwkSeDHddyjK5RmugqJEGC0yXK80CoYUb3YlaR5v?=
 =?us-ascii?Q?CIvh9OR1XTAvuGt2Gzf/VcBPR7qxIhSYMqw1/KRz2HonFp+IayGkwqYBiuRr?=
 =?us-ascii?Q?yFxTkumqjAb7FnxuTLv2ZZ6VcP2TTd3+D7A777pq7zCVg0O+XcnZjPyBI4gh?=
 =?us-ascii?Q?/wRB3QKqNbRtyzvX6YCkBTsMN7pF3/K1A7LgqsrRYqlb/j12Ofe1P7yg7z30?=
 =?us-ascii?Q?JjZeR3NfK7SzzXW8A3YZOStKBtVIXYmYv44Dpmy0kjSxCd12VCgnyjlXlYvt?=
 =?us-ascii?Q?jMqp6IGzriK2b7VQ4kUnNx8pXo0hs4Um1Gbwn0ZP4RXSy1JGnu4NLZDOw1Ky?=
 =?us-ascii?Q?J1dNZK52Geila8FAOWMs3nwp/+xWMZTiL8dtbhd3MK45CH4Dk9ZSX6saP52A?=
 =?us-ascii?Q?ocKXZ+V+ez5DV7mY9LMo95hMrwDMc0Px1piUZ7HESlYh4DS9nakE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c649fe61-c750-46a6-bd54-08defd351e38
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:29:31.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zwr7cUoX5pdgoMx5wIdKsBLm3TV4YWmCVnHvaWJhETly3ILblLX5jM6IEenwjuFq9gZgFoo59UwmzgWXmMhM7nUIjk1kodpr7w0RHejFxyA43YW8QmVyI1OS/9W04DNT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17734

The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
host (OHCI/EHCI) nor function (HSUSB) instances:

Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found

Add minimal placeholder nodes carrying only the reg property.
The remaining properties will be filled in once USB2.0 support for
RZ/G3L is complete.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index c63a857f0e5b..5951a68c981c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1001,6 +1001,31 @@ queue3 {
 			};
 		};
 
+		ohci0: usb@11e10000 {
+			reg = <0 0x11e10000 0 0x100>;
+			/* placeholder */
+		};
+
+		ohci1: usb@11e90000 {
+			reg = <0 0x11e90000 0 0x100>;
+			/* placeholder */
+		};
+
+		ehci0: usb@11e10100 {
+			reg = <0 0x11e10100 0 0x100>;
+			/* placeholder */
+		};
+
+		ehci1: usb@11e90100 {
+			reg = <0 0x11e90100 0 0x100>;
+			/* placeholder */
+		};
+
+		hsusb0: usb@11e30000 {
+			reg = <0 0x11e30000 0 0x10000>;
+			/* placeholder */
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.54.0

