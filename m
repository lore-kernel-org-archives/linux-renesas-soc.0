Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1F283FDC;
	Mon,  3 Aug 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763708; cv=fail; b=jXnT13IX55opvnvg3Iv87RiAk0l4qGX5WE9sL6QWuWOpu/Oe9jBGKLDdqnKSEaUSKFfW1WH3GGqmvj6P/rI7tfuN65/XhvWv1DXq2ZEXBB7+1dGqZRcbHqXETYnzpZGRvheo5eSS7ik1dCFaOz+3tC7OzxqOklgbiluzL/sa4yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763708; c=relaxed/simple;
	bh=QIVx+cpP8gAQ+QebLIHRWRjtmZ9OngCUuCwilxy2zH8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Tt4ORo9/woaGkdzSQut8MlJr98929ZE11KhwPXsf0aDFGRRuNOydbCGTjh3+D/KXft2+SGCzAWAOYP+FgtBT66ZVaKbs/SOr4iBwNjUWO3O15KHVMrs1IOKoSr4DV8806kqsJKAsc2YbjwkFVG7q3nUxtKd0hpF+WMKZTJNB+lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R0/A7HIT; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R0/A7HIT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaixS6TpDr+M4iduIOqVybbWbYg3ZXQLHZKhtIK9BXiq3m0+Czw5yLeMuLEba5/AbnzlcXjKreOZdB04OA67tdHR7MDXoPw1Kza4GPgjq84RDs9aYRcJ/KVwkBCgj6FECxDI8q6q2c7u5/J2WBRjsMx8cb9cvDsrwkFvTICaaCybdGcuY4gTgXLuiMe+mOLTZfsFBE9BQsvcd22sTZ8RYbnUNtuc+sqzqK/YCJfDPSg2/QH0poa8ePoG3NxTjvDCYy7sbrrOq7sAPXd6+nbF7fxNGWmo2JmKaNWOPHTkA4sOBGvMR7dS4QZ5rtSRuksotLnphNzQoE6E/9WVdRCFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVl7KEeN6sH9X82/egObnh3hbvw2Rp/EWbrSVWu5fm4=;
 b=Xzt453TnVmW1Z9qMYtjRU9gTpaok+/57DPysEtJcfUK5rxesb5v+wqPJSluDeUFCfTtqWFNkkJN8ohmtR7dEc2LS5WAL/yPcpzZ5mjzXu5mAjugbpsUsbb/vwNpnzfmnaRVO7X2EDShJmp5EJ/WW0E5xKQzpN85wTBKF6HKdOWNXOWBZuqJjMg3G+imipNhaztEYKWuSluVWsKyu8ZAqUXqGQBnRzQhVf+5glDvajVbpce0lJKAvSw5F+rON3V4rO/LnTVKt9JjVVdZ1XxLkijofW2MgL6xCzXbNPb6iBMG5iOMgkiHaHjtG/hYgx9c4cNikpGMpfL2w1FQogTO/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVl7KEeN6sH9X82/egObnh3hbvw2Rp/EWbrSVWu5fm4=;
 b=R0/A7HITSOPSYaeiPDSSYuWzYZyNW3vWki6vFRWCx7pkggaCLf8amp+afd8lMZG65tMrTyjngEPw0cRKn1iJBCZ18llvZoFFSWLSOwuBFSj6hbAKcIDZVBS1n/fS6FujUf1olhJoom7jMLSYBrnbFkRASTbR27b9s+yHd3mIKf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY4PR01MB17923.jpnprd01.prod.outlook.com (2603:1096:405:34a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:28:19 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 13:28:19 +0000
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
Subject: [PATCH 0/3] RZ/G3E: Fix dtbs_check failures
Date: Mon,  3 Aug 2026 15:27:53 +0200
Message-ID: <20260803132757.3248187-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY4PR01MB17923:EE_
X-MS-Office365-Filtering-Correlation-Id: b383e85f-d334-4c4b-2133-08def16314cc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|23010399003|366016|18002099003|38350700014|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	SIpwHTfi9lN1nZ1W/WpQHuM0D6myNr1jkmQWosSf27Bd8XYCcu35Gv6Kuz7mO41NxZogYLwP4dsOum2LojWxjwHEZpxR1qoQJm/P3cX/FsBgpAKQQwjPCbyIQnWU1S+qO6gOSyd9eXCpuMzjPHV1U+c1V+btb6c42ApMhh2eLTTHAs2tpSoswjuTxlU3bxpQumnLQhdN5n8JovppTCMvrb9NL7g9m000xpeKcunzjjRj9yPj3tf+NZzAmff7TYsiTe2XlAojw+zLRJDXw0daHGY5spDpKJwa5mxMLQ7RgLIYSXqBdmcts7Z2O/Bl8D5fjwFLGzSQltvSLVmQfdLQODs6/B3P2KeVU8H1x6ffEOOESzoVKpOOv2bLfW6yAWtfgPEg8tq7NDvSnalrz1vTgPekkRCzcvnPwyLytArPpkSQ/mYCJMHoCyYjJkiB80Tup8ljq688131UB6J3AnFkFVZavM9OQsqPMJXlOFwNYYMBkqMXufCDnASfNZbC293bTrLKesNzWnIZeLEnwIvht5HK8oCgJnuu/yuIxXt7SXJWhIRFSkstANzyIBVW3uKB7edPi+WA4l4xyhn1arDqfCnr2U6mwd2iykA6Sr3F9SEpZaU/R+i4+YeY8I0aR/TmiqNl2txwWN2UPyosnD84jKOaAfimaaj+bV42EY5zbXWLf3dc2/jJvvCQW6JEqxcgtQP788n61qWK+PnTThr65BF42r0vF4Ny7CYf+vjAfbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(38350700014)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kU6vkYSgvyjsjP4htPYbhTXuQ0FQaj9KZMZKoRSI1Cxy7rMzjOUKl+sPfkJ6?=
 =?us-ascii?Q?wX6gAv+neyWzCUHiIuVxx1yicKPISvpwFL7cLVhHzqBuYnGgUpJOROysUqxv?=
 =?us-ascii?Q?zSrdlh0pZd+yybFMeCxc/kH6n44rGYKAt4b8lADozGYPRW3RSl/ceAr7S7fV?=
 =?us-ascii?Q?r8w37sZHRHpwMj4GfjPan2MltGPH6j947mRlgZC24ns3DfUo7yjKoYkDIWFC?=
 =?us-ascii?Q?7Iy7hdw0k7kNdXpQtBQw+ThX9kZ6j8ofF+4DSWT1FQybi8IVS3OIf76cYZyp?=
 =?us-ascii?Q?DdC6XyZ0TMbAKjI5NKqXEJHzWxDF5pYh8G4G2W8sqs0McctqRlRJuOEBuzEW?=
 =?us-ascii?Q?r4ihEu09GShQQD54LMI7fo1dBC04G/NLf4sxYpcW1+ijhEmwY8E9PqKC4+T+?=
 =?us-ascii?Q?dRsjy14lsjDmuIMdCuvL20WrpWyv+XdziWrN9wOmWHmgcQpXwBg28hSUj44S?=
 =?us-ascii?Q?ch7e4fZZ8mBd05VdIErx0SJvtCjlMj2JvJPhvF8M1GdBf5Sgsby7pKvRFoBG?=
 =?us-ascii?Q?r4uk6GKPxNrz6nJUSUs1wRiw6LWDemk9qdHSJNwUNNFbQnS7esjqT7Mexgiw?=
 =?us-ascii?Q?2odFnsymLt00Wil09muCZ9HP7qiZdT3d7rm2ZjlNBD43c8DIB8QoEsTXrO/T?=
 =?us-ascii?Q?MUXfUXuasJAlqxGS1Fz62CdStpeotsrB44TI9NP6DO8ZsB6rQLQ71UbLpp4/?=
 =?us-ascii?Q?OrBBAi4ZXy/9A60gkCa2DywKH7FlIqF89mXomtJKHkkrQHtpVvCTPoV00o77?=
 =?us-ascii?Q?6Zytr8SeF1CIN/odT35/ALyYnYm6pg4RrjqRHHHt27HHGvuYQbNjPjqkj0YQ?=
 =?us-ascii?Q?JeEDGMMrd4nXx08mTh0vl2udCqJseNf6dV8R3H0fwawXK1q0UpOPn2QzPoAZ?=
 =?us-ascii?Q?mAqvrlGOG89id8S5fvcNnuLT2A6p++ru9wdbbFCrWQGxDUmY1/ccfgIG7SEt?=
 =?us-ascii?Q?ngwu368NjApOxzuZmeNUPCLRsw1yMdOoAcOggq8qVYJs7KqpOek9xhRQ9tZI?=
 =?us-ascii?Q?bYS1Fcl1AGrS9uJc9+9XJvDFApgdILKZ1tHbhpZsmrLFblJ6iq69XA5Wx0u/?=
 =?us-ascii?Q?0+SSz+s9N50Z6WRjc3T1isNU6/vi5cFeBRSAx2XIsm2oRBSM39ueVYF5X/J/?=
 =?us-ascii?Q?fxdDYadourQsUNq0uD54+qrMJSCic502+BXepjIWrH7Gsl4XEwGUaCwe09vX?=
 =?us-ascii?Q?fN1gdA4LMGs9rN5ehJEQ4NZidV6qWMx3MsbvM8ZkLxos0wPWlq4y0o1tdzEv?=
 =?us-ascii?Q?igkpieRmyN+UEWj6Dpdhj8fPp98Dm8FRxwZdW2RSo4eJipGDSOcm+UsT8650?=
 =?us-ascii?Q?WxdaDXT4b4WN8Gk5Nr1Qahrrx/pxdfQJLJdt6tpzrEXDxe0sMtKQRXTRhRcB?=
 =?us-ascii?Q?pluV5X8d4csruqTQntDupdDu7/Zi/+ETIrbcPOKQJ95mOEwlcn3fFahoRXfn?=
 =?us-ascii?Q?GV/ip/Kpb2vVyKEQlRfivJVZxdbmXOk3mfNpwvZcbfP+t94/ZjNGzatRUOoV?=
 =?us-ascii?Q?LNCbX2KSmz+HgXdwqw13yygxxzm9FhY4cFEuWyZwEbfI6x5vGc2BdnyU1Y6G?=
 =?us-ascii?Q?9coLgNUjDW750FyhQAUwjJOLnwlcK5ADa05Nt0r6zSO4yjtMM0O10BuOQ87N?=
 =?us-ascii?Q?/Oq9mNaqy+bpXjmWqih0/yd7o8P/yGp87hCcyoYbadixMhIiM1vZeaDeEgCD?=
 =?us-ascii?Q?fvgmC3Vr+iZdows2X+OiD85/TEaPIok2w7FWRjyWwmcBRE8d4lCKng1LBri+?=
 =?us-ascii?Q?2k+FUaLP3/LvJ+3GgbHGG4xj44u/VnnyJyDcUR75LjhnGgF3oaNE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b383e85f-d334-4c4b-2133-08def16314cc
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:28:19.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTWGfx9FkbNTmEfst/gT/L78DnmfGR0B5+3E1nGcXbZz5bM4HErqzLLoJXWpOHa4xmumDdzDTa/qQ2uDWFlRZnMFMfGu0qEaYhHRSIFwTyAwyicuLY0LDpavjJm8h2l4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17923

Dear All,

This series fix the following dtbs_check failures:

sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
  are not allowed ('clock-frequency' was unexpected)

i2c@14400800 (renesas,riic-r9a09g047): 'clock-frequency' is a
  required property

Additionally, set the i2c1 clock frequency to 1 MHz in r9a09g047e57-smarc.dts.

Kind regards,
Tommaso

Tommaso Merciai (3):
  ASoC: dt-bindings: renesas,r9a09g047-sound: Document audio_clkout
    clock-frequency
  arm64: dts: renesas: r9a09g047: Add missing I2C clock-frequency
  arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1 clock frequency to 1
    MHz

 .../bindings/sound/renesas,r9a09g047-sound.yaml          | 3 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi               | 9 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts       | 2 ++
 3 files changed, 14 insertions(+)

-- 
2.54.0

