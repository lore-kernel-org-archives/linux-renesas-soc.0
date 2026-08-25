Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362B26B95B;
	Tue, 25 Aug 2026 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663770; cv=fail; b=Pk09spMdwmL1O0oMAD4QnPdm+h7ScDHmShYce27QF32TLqz4GarZ0JgQmBjOXdsPJDQ75uNrY4TPqMVusbwFnmZEDFVjjY5stYn/uM6reZ0DucpZlAyBkYP6QoVO9swJU+nmy0KEPc78O7CY8dCLC9zI5mYA+db0528wttHdCvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663770; c=relaxed/simple;
	bh=4qL91yWZNsCrH4lVLDxGeIN0h3BzGyLjWmbapCB5oYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UPRgr47BIQM3Nbii0YF8MIffBDaBiFwM0oXMkr+xsVirZUuACN76RD3E1gE0OxMi9djkOiVsAm+oRbSwgiERkcB/8ack3ruTKlTuDKBxNsC1Dtj+rGEPUdi1nTgcWW1r4I3elJEFXU0I8PYDrsu36vFjmoswPqBN92TqOcRoDcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=b+ARhSGR; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="b+ARhSGR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHfN8JVux0Q5fy1yN7oPCeBdZyU1klPjUvr29vM9xVv+gjEeWPSJDc4FlsULahTQnGnlBupnwMW65Txvy2ho9tZSac2MJkUOtDcQEgl9srwgwbOSUEcLY1GhEctGnxn5XWsWEbUptaeYzvG1BX2P47vm9OL7axVPqAj+gFeR6nPoQ9tN3GyKfTHW3xpRnPr+J08W2OCPnGrysgBMGl0hPjnBLYjaQb/u0wraBWrqlFTSDZsEQyoxcCXOcfo41sNpaS5/LbMnDBrkzlHI4gDhx83UwjBr4UXGhi9hEw2dkEb4wGW+fsITCAQT5BZWcJ38uZkvA7ghsqNPB7mYTpc6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CUul8UKFkVffHyVu/NpBvTSDjIZBq0q7xGiFgMhadA=;
 b=qjKwSrfV5BYqMoWWDTSqccU5g8wQ8Zb6O7fgkRRDREJmjWp1l/QmWUgG2zLF92h6GnZtNjNfKp9v9ueK0Qur1CjuheSlhwztxWS1x6loJFFW7fupImFayhkZqWuUVHUZVn0Jin7ng4feoJw/MtPAGnPvEaN68KPDUkCOAx7oNhXVnytpTwY/unKkjJEMhzOpE/mvQ7cldj3fmTaT6CtjDzwRgfCiqdXFN1Q+ct3szUuGSC6uhlRz3CFtoHP1axTpb2Ih3NkDbsFdxZDo39j1TcIidM4UAzP2vwgOWmn3lnEUKYP/2cw/oniF1N+V81aPWilD3lDfXTSsouRDDnuzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CUul8UKFkVffHyVu/NpBvTSDjIZBq0q7xGiFgMhadA=;
 b=b+ARhSGRBRrYFuvwzbZZPN63xde9NYtSdom5Us+zphWq+t5poVTAipY1XRQTmdrWj9zzJBILsXEYegGEF4+uM0EUrSq71MEYgYY0n9E9vkgiIJbC+cYrVXvemo+xQgehpX8y7P0E8W+jO/gD1ZofGMkl7rO5kZvWfUDMHJE1lho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYWPR01MB8495.jpnprd01.prod.outlook.com (2603:1096:400:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:16:04 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 13:16:03 +0000
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
Subject: [PATCH v2 0/4] Add USB2.0 support for RZ/G3E
Date: Tue, 25 Aug 2026 15:15:21 +0200
Message-ID: <cover.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::15) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYWPR01MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: e1642eb2-f77e-4b8a-2acf-08df02ab0384
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	As16eAaq6ycPE8j6rtygPhvhn6Xd5ekvnW4vz7no/huLalhhDknCkRVEjCUUdc8g0U4HyHsTgcTB6Wj2g+3aKDIf9j6y/AsVbpSCIyNVjNNM4vahndoGVZTzZfakOetOwMyYBnMBTOac7VM+iuHenJIjrxWSrWmzH1xqv87tzxoeGT3nrgk8beNyM/cDL/pKj76pfPAstrcrzannZ/VIgX7z9rz3rMsAvf1Irz66lkehfUvJbNSlJVbu+7HfeW5lsAEqA3dG4Fx7IuBu7XETb62NsIsK9+1f1HL7nzUrBMZCpvZrnK9PapAdUKGUUR3YAIuLDaFBMfZr1sjj8PtFZPySslwSANOWtQxLUbeM+4P7YS3/ROAcYBp7JEx8jbk+RxFHcjyh4e9HwlPUG5I1TsfcjKtzQXtQEtD7vVZ4uGwOPD6Eu2d0bu3+UOa0Nm4smL86wHMenVrFo5hUHbUEoo4DPD+q8klnN4GjoES7JeWYVjTXmPLyKIWVUXIHnBOaV8HtVdSBZaoJ7Jd5WpExoiWOt9kqHeo3sfSZGHw006Q5XRZI3KkI/a6voORvglszik886nGZhHBKw/7gNDq/ck+woErXuHATNPVVuddpwqRto+4RHamjKsV3UZ8Bdr+r3mKmQgjA4tBc0a+DIp/ZXdz/N3m/qOWYUlkeVhEUCTOucOXkExGteHz/y8AkMDGWk3emvEODuIMafsXslORSb9djtRJbYUVWjs611iqgWow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tI2MClyzqBkECs5lnQQ3/GR5KvQp+8zs6LSDT1uRjpbGrp2611so3DW04BXD?=
 =?us-ascii?Q?L15nemrE3AmoFHLE2EDHQpNiw8yQAfZt0dNYLTEZinyAHgpmaudwQp3Tn1Yb?=
 =?us-ascii?Q?lzPleS51fi6GWpmy3sp9WaOAlq+rZF9IyFXzurBjBvUA8kgoRnEI02varj6p?=
 =?us-ascii?Q?H9DQKtfaAHrVadquAu4ws/ajPlicb3uxzKTU9IvWp/En5/eNjh0FgWnoAOyP?=
 =?us-ascii?Q?yF/555GUAgeEVBo4j5rWBRNiXCgaESB7RbqdViEDHZneIp0Q6ELLVUHuJsaK?=
 =?us-ascii?Q?A5my2c7Yw2Tk2HF/xF/HbDlEoKHnbcOm3EXbITjGEml5yJe0cem7yuZV1NYi?=
 =?us-ascii?Q?m5J3j15EQNZgaudlAAYAJoGc0Ya3S/NImFWHdVkQ30VsYNjQry1aA+GOLQJ6?=
 =?us-ascii?Q?CJr4t9vGkAojTfLrMqy2BaNsSaQBfaT4ldVKuvSmpuQKN1KFN9MK5PdW9L4m?=
 =?us-ascii?Q?ReR2mV5YWn0jlMRbZo3AgLSW2HNZnkRcE4fAR04leYBW0i+IFFsRYbw4yURG?=
 =?us-ascii?Q?dtnZejOgGAmcGpScmsT2LufmYzVukW53CgHZJu9q3sJZ8ArczwAk+kGOwOln?=
 =?us-ascii?Q?j7/gSAERd4EPTkZ05caZXtZZ+Hsu5poBAaTLrUKpSQPyJi/QkMCAW+q8qkx/?=
 =?us-ascii?Q?Quvu6ao/2OqCq5DiAhaP18BA0RjwdiHDWV2jPMQrTcnVewuFO80Fi0B+/0iD?=
 =?us-ascii?Q?RbgPEyfW6bLt3cE6qbU46CKWd1temsgXUDsjeWPJTGHza05AcAKp1+fy3j91?=
 =?us-ascii?Q?lrVGHpiYHinyI0E40W4wU1rgzNWf2Aj7Rft6yjP7wKZ+5lPfAijtwotxeDbP?=
 =?us-ascii?Q?xWUGKdLxMTNPOYd6T1doklsXfrGHp4pfA3kWiL6Zwh5DWHP32Chq3TX9ZFKS?=
 =?us-ascii?Q?f+c+M2VdW/E75U4RGQPh8tAkKrofoNCC6h5ImE/h7W1uw+KDNm7DXXj5cbgB?=
 =?us-ascii?Q?Bjjg9lEtOSE+s8cMqlYJ4eJBtQjoGe8tTIhzOX1YD30UC+JzvVVioITo55cK?=
 =?us-ascii?Q?XW7sVQr6cj5DriGTmiEaBQrb1JsX/3q3ajcUcNUc6HILpFxwit4fIZgaRit+?=
 =?us-ascii?Q?cnkC8bW+cb4qik/+v2hr4Zzrw7pATXyUzFkFB1iRT11ItpMtOHOHyntyNCRb?=
 =?us-ascii?Q?wlVAVk1bifOhE4AOS31W39EjZNek/tMKLhxUQYMWBWAxPHcJmrfIMd5bsw4t?=
 =?us-ascii?Q?34/9T1+RkH/j+T5J2sIMt31+40lhI71iXaOFfLwUujT7gop30cB0YqJBGWqC?=
 =?us-ascii?Q?DjAJ/sxslN6eGqjLOQTTox3Xz8qWmmZDlOn3fDUPFhboQuod2fpcBDl7olNv?=
 =?us-ascii?Q?eLZBRoGw8tMrNn6Ng/2CrJgVv4Hk54ZQHUdlpx5uDlRsuBJVppmCGKlRw9tm?=
 =?us-ascii?Q?VqvdInpVFigZI1dYjUTcNGxYtd4V6w/H/DNAG3IYVDsaSBGdnhKPcRjZV+uT?=
 =?us-ascii?Q?f1omfm/8i9Zg63izjx+qF1hxY3o4sx7pZa6I/284VKbZQpKIPDuXzdWudeiQ?=
 =?us-ascii?Q?xeS8s6McROGnS9mopbi3+343m5YYSHTRs7wAnLkdO1/Ibc3pzWN0F2RZxfvl?=
 =?us-ascii?Q?7kdWog8qByPmN6HfPoFtyKN8CeiT5Lm3OHXJaJSvtAp2Iuj/V5BBJQocMmfm?=
 =?us-ascii?Q?spQWPvk581fRZQh1eno1ufqNx+WeWuT95YmQcTuLszcj+J5XJvB5GSTtbGaT?=
 =?us-ascii?Q?H+gb/KhImvYi9d7hHIosqS21dkMBH8Pk9Wiu4av4IAWccDAWc2D+c+GFCz6Z?=
 =?us-ascii?Q?RhixkdM/OrwV7TFr5AUsTw4jSrChgDZjOKQvAEhAUGCiwTwevJQ5?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1642eb2-f77e-4b8a-2acf-08df02ab0384
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:16:03.5642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuwXsVALWy5JBkcwQAQdCXU8mCsJFJ5shwiO5BMxfa9UrBRQevG7u69FMNMZ2hlxa82/kvi+RH+194P0md9bFehetNsSmMs3+Jl4GHuOYhmth3HllTL0rNqQu4uBQX0Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8495

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board.

Kind regards,
Tommaso

v1->v2:
 - Included PATCH v7 7/9 and PATCH v7 6/9 from
   v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
 - Drop placeholder patch
 - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
   Update commit body, and improved usb20_pins, usb21_pins comments.

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
  arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes

Tommaso Merciai (2):
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 142 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  20 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 124 +++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  45 ++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  25 +++
 5 files changed, 356 insertions(+)

-- 
2.54.0

