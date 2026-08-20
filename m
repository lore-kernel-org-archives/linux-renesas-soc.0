Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94FF2E282B;
	Thu, 20 Aug 2026 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219900; cv=fail; b=k9I5p/Yi2TOd5vkjeQ5btX2mHWOBbwp5HR+bQPAv9c0MBWm4hCiPHZpEV6q2MNSbEc0+uaYX6Ae+yCK9CG1RdiMj+46XjsPNvPZRfe+LbYPaKrc4jNxH7ArXEfWT3FHOmDJHvu5a3Zmf4RnCnlMeG8qGKQCtEjnI1oGSN7AGLoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219900; c=relaxed/simple;
	bh=mr+r9JJSOdvSHik6/sS+eEgwS2uqwx1R2OIOwfSarAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XHRwEag+fwLjEVSK7HaFeyyPHjjm78E2RRdKB1/h4S9P6izistqOydtNuRDvu2BF7tyX9KDJwqKffvi80Mi36+M1ncQz6dFwrmrVcXRJxMNfZwy1lSJdI4hetdQc8cKt3l9/yWE0v8AUS0/BRyfD0wWD9+0DNnLSBz/peRNteD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HRu+2PZQ; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HRu+2PZQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOvNQQirCTdOysOcwKJxxSClnKmocRSZ7gkaakRn0obLEBCmvxxAAGPeeZXNAEjcGArX2+YHCL9g2vj09Pe831y8TP/z13zpFY7n6hai9/Iaq4cVH5pEwxuLf+TruOpN06jye5QkYJRRKuhMc5a444o0DG4ZN9GJQPaXyICo/zH9T3NeXVhSDTBrv3Y+QwzkNIgXlqFKDfBFFBSFRBcJ21ufaCB274Gj+Bo8k0XZzKmj2pn4FO4+IR1ENOOeKB3yQKw3HKjrcvQugXKU3uvQb+be4nDjhlbpLGR0BkOQCQd7w6Joc1NffpT6JBiEgPszNHN0BjYyzC3V37x3yCCeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnUnLFt51S+6lpqVKZdPMg+bbwj8mYItyWKLvfwt8Eo=;
 b=SCZwG8PTX96bfO25umgA5ZWla66oHB0nqXjkwizheS68aIWp21up3mmr3LE9QUnK7c/RvaoV7BBkx93iOdi6ixhMUw/ws6OMpIb9S1mNSojfAeL5vg5wWKvj42ZPj63S7vdsJQvug/O48GOu1FhQhtoU5jKNfW3jKzT1pULLCVQt4jbfVwCHKp9Fgns5+CQv6Y7vmQ8NhcLq6DWU8yrA2T5NGqstdJnbqe4lwV8TzsKrEsW58XPPk0uJrB1CcICIPSNooh4ucLybDDGYvKNSZnUYuQQwvpJjQvI87IGpb6kFNdEAWKfm55HYm9vgLcj53GJCHV6P6rXm82gBz+eaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnUnLFt51S+6lpqVKZdPMg+bbwj8mYItyWKLvfwt8Eo=;
 b=HRu+2PZQqDocOKC0zzdtwX8vTSM3KVnXPVY/2XmnbZouEQRBQvrenPSjhUquYckz+89Ep8G5A6EqEliCniKxMCk2QQiTe+TBrN+/2HRms5EJYUGUWEMDy7URQY3p0UuawsgBfl9RLsRegyiAxQ1GiLWcpFMFvjjQYDFb+3KdiXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB13124.jpnprd01.prod.outlook.com (2603:1096:604:34f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:58:14 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 09:58:14 +0000
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
Subject: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Drop #clock-cells from required
Date: Thu, 20 Aug 2026 11:57:36 +0200
Message-ID: <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB13124:EE_
X-MS-Office365-Filtering-Correlation-Id: dc806113-baeb-499b-9784-08defea18cc8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|376014|366016|38350700014|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CGJ5Xlo52JD9hB2mMn3O1gdC8qjkL1yntILZGnX3nkFlo5hEUd6YX58Cs1Rh6O6jQN3Mkm8ha+OIgfcjyQnrJEN9TADYvdH3t/yId9Xpf7KqpxfwTjpwXF3qL8HCmmPYupHHmqbZnh9Oem8uys+Ez+PozX6NSx/kK5AqDZYsMmJC/um/MgwIVi9P/VzGX14eOwCsQMtocoD/DpXU8mnaSX1WVu9UYcGfGN6Hg94a+OymCmds47uotnzsscmaPymDnF6n8kmECFtrlWxT0fB4L+VB+WBooLJDLwmxT2kprd/7Zm8bNkE1gYBnTNX+ztuYQwU+oF2Vf54TuhvzRmTL1nSaofiJG9fxdnZvaHxRyrv+bpdqXbcHBCk6Tomr8by//MzZlY4wwnlriMlIzFAz5AZH6P1A/AQJIppzZKlqmD7Zp/SgRDgL6CQggNCFyU5wShhfcRGohMhL2S8BBLBQcLxkY2KNr1lPuft5J7pQAZPuyij4SLIIaRkuBhqgJM9d9AQbmEi2G39ZHQ/tY65LFURehfxMF15i4xyMDz+9jUDiVMEGwzyGNPGn2eAVZkgsEKiyVOqYPsxcNTobyEJUt174xKupwqjEv5h4xAvA11WJfZE1qz6yA0mPSeUVQTlbcShDIO6pWrDFVK/q3bydCv5WGQj7r/mBMqQ4gxsJwpN+kKtiVpd5LZcibtt0YOTdrtUUQbR8+wR0cB08jLaiXRBpmgDdWbxHyZKBVrt2LM4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(376014)(366016)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Z91BNz4tU6OBreBKPvJAcCJG92/A44ilHyy3GZm4ftfdKYwt6qOxwkAm8m2?=
 =?us-ascii?Q?+tHm7HGIso3fCo/WAY925N0+QboBZLX0CYUjYlZTLaVtVZMGTbVFEe0b2nel?=
 =?us-ascii?Q?k3aCRNWDCG2rfLjdMz7SUSoUoSOmcdx6co8NNsK+Q72JSSEzK0ADr0Sidgu0?=
 =?us-ascii?Q?v47VDt2QULXOvnJSEwVBCp/xQJYli0jSow0EfwZNpJMhzao1MsLXddxlb9RK?=
 =?us-ascii?Q?7g3rCWKHmASmhkfbZEfZ3ONzRtEqbyDrJtIgVM+7VG+MbaENw6zJgA2d4YUF?=
 =?us-ascii?Q?u5j2ZmWq3TBWOZtG+jlLWsp5pTvLoul/Z9Im2VpH9qodvirsKU72B+zYnojO?=
 =?us-ascii?Q?su+IOoVBwEWFq30GlDZc0ucwLN41pQJ0JeFdqj2i2yBAfB07QcGe0+3ie11I?=
 =?us-ascii?Q?qrQvoMq6T94PpbjPbQjcbvCJ0pPTjlOOUcIRIgX9ch2gYN1CQsL0SI+viynl?=
 =?us-ascii?Q?SGpBtchLQjzVJzwIHcm+NOdOIK6gqhHeDvUHc4Xx3RNCwPSUwJVRe4UbxbRq?=
 =?us-ascii?Q?izWq093ykh4nfVKhBg8GO2wAoIkoyHawLtguIaDVF88ouhpf77A3Brn1nuo8?=
 =?us-ascii?Q?HldQJ64h5owKs23ZBbTA4EU3LVUz26xnT3nBmPzAZ4WU/3Y/6F3RbSOpqFDr?=
 =?us-ascii?Q?lW65HG1P1dNTYR8MHmoaWlR3cb1AoEAj8+4JekVXM66yToPz3UsrqoNsqQ1w?=
 =?us-ascii?Q?AWaizBLHdz6IdTxzsuY9YtRy/4KVacUhITF3ol0fvZqtWAJvcpEVXc5o9jA0?=
 =?us-ascii?Q?RfJ9eihfTvv8F3X0mbP4ltPgOowUBjozgcGGJ0MDzfsoxOFVWbDt1vYcuYMk?=
 =?us-ascii?Q?ROP7w/FsCScNOtTc80xNBqWLUiXOQTBktjKADoRyZAQO1qI3wuNAhBebW3Xd?=
 =?us-ascii?Q?dwXqVkWfsYchA9FAfcfGmBN6RnARZoUrMDnV9ONlRDb7bRYK1c6QTUnau1Hw?=
 =?us-ascii?Q?P2GmCzADrNkUWzswaiVmRVf6RhflB8IRtUN7vZ44bey+W3U1qvnBv9iWuaQt?=
 =?us-ascii?Q?XsTk2AKfaNXBgOTfNxnjJ9Sy0MJj4UKMk89QuyevdxAONh1E5oEH/WZ8j571?=
 =?us-ascii?Q?LsAtq8Z2JSj0E2KvOc0+bXz2sti/980SGOK3paJm85ROWw+5gQQqNEs8nFy1?=
 =?us-ascii?Q?i4xG0BW0PPw/mIkLUM2G5jNC/Dt/299HXcpNB4Tm4LZL2GtdL3E+uP0IoE32?=
 =?us-ascii?Q?Poepze8ef32ODjLy33xGNEg7z6oDh900FQMB9x7KfrGJ+7RvUG7fKaM75PYb?=
 =?us-ascii?Q?ZnvWTKgwyn+7n1oI/Y7cLLnp0qL6vNYxywdbPo70chIHE+/D9pCagABr6Oba?=
 =?us-ascii?Q?bI4t2V/KvKgRSACYzfCPg8oaWGGK+4MVkSDsfYj6PYoAFqdsdGNrmZCrZ+Uf?=
 =?us-ascii?Q?SMDBNgbsnR77khCDtrhaLe9NVpZsOmrNOc78WtVxNRbV5mBDb26u5v/zY5iW?=
 =?us-ascii?Q?5qv6uNMqfz4Y5HFvyAunB30Q6moH7JJLKbliGT6jcMZF2ybBFoYXrfqBc4Wj?=
 =?us-ascii?Q?iMHXCGKNrYxTdD3rRH8uXmUuOQ/pjdex9A+0Td3THHEFM9JOloB0VRpTat9T?=
 =?us-ascii?Q?1qrTpn6DW3qO3wjza8yfemnO+K6SAJzdbY5wEgkNY9T9pX43oiphJTgp5L6P?=
 =?us-ascii?Q?3aGkj7AbY44Atq52sPpzE4RaUEmT3NVKTf6jBQLqHcbVEnUgei6lWk4tVasF?=
 =?us-ascii?Q?8YQtra3KMC8uThNHDxIPg4aRstALDMCNuV8QghUnVkhSx34y1DPg1XGxyczh?=
 =?us-ascii?Q?BFKNhiVIUokbxQtArXYSNslf+vbTByxrWeMMYHeJOp9FjR60FDvZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc806113-baeb-499b-9784-08defea18cc8
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:58:14.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOxL5KWF+c96Dv2ioDwLNkNcpgaTXB3F0s0Fek7wXjvKthAvYGmR26lLU6M5XwslgHI7G99yZhhkzu7VXfePykECDGRwrokxJNDj8JFPlNK831jjSgZ28wSYRVi+XI+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13124

`#clock-cells` declares the node as a clock provider for AUDIO_CLKOUT,
which only makes sense on boards that route that pin.

Drop it from the required list so that boards which do not wire
AUDIO_CLKOUT can leave it out.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
index 213c1c40b6f0..8b65a5713250 100644
--- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -298,7 +298,6 @@ required:
   - reg
   - reg-names
   - "#sound-dai-cells"
-  - "#clock-cells"
   - clocks
   - clock-names
   - resets
-- 
2.54.0

