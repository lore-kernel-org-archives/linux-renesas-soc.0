Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40641A558;
	Thu, 16 Jul 2026 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213382; cv=fail; b=RoZ2He6nrGBpLfdN13fkW8BnR9cRdktak8r2rVb90bl7v7TdMt24DRaINOzg7TK3JuezaZPrMrA0/HATQH+OWgocJYcxF40ZfVhKjaV55gpsYXMSSRqmYMvKCado3+9mocGq2c3lUdRV16lLC8H3ANwq4I3bGZUJoMjW95A9I5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213382; c=relaxed/simple;
	bh=j1x5yxzI69IaUKxJVMs5wdj+mDEkHTmOBhPxsWHJno0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hEDIjcGeKWgowqS3Z/1Gho9C0te2eu6z3zi4jXliY8s2/o6cAjqGRU0jp9h3V6m+YVG2cvNRTZoZiM/qULN+SqLhpXJjlBRbXi42IzZmI8tnEGWLIQ5c+V6WoMQrSNGK2RNej0jvks/fiBl1cs5pTYUVF12CmCA2kQRq7Agepg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T+3lVjNo; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T+3lVjNo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqsfCbYogaVr3tFXgww2xBa5t1iaiOuNDtxCSrS83i3zEan3Jgp0BmmB1pY0xRNBRZ0loWD8Sp0Lr2q1a+6CFWKCFjHIXwL8L9qfJzlwBo2DiyxGoulEiE7kLtbF2+x566Qi849IIFXaY3Oa/RoYzHhTt5rkadP6U31YKtS1mFif1OfxPjv0uATZaR7JU6zWkIRp2FM9sM0muBnFFZSbZGveUkDlEWVW/LrGAnWIUOFuQvC5ssdAsUf0T+NkJawo5K9577o88/q6rSkzCPBluw7djfKESbm1w3ynMGrdVoP9xUU85snNIDAMiv/M4O5qvaxmGvwv3CMNQSi0sYpJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+4O5rz8YkcMXakY59FOWAZ+Tfpz85dSRNfNF7Rbr2s=;
 b=RvEWiYMa3++5mIk3U6A01+XcgOursHcB5+cyZZfOqM6T9MXQuTwHcA7DKMyfdWFYEb5Htmt2CvtX3IHltxuZnwdsnv2WIrfN/IMSpmCz4th8b9LKlZheoeVKHJT0BuvoXxNdN0V83F5Zi8Kp2tusfwsfGMI+sOQFLlp4DjdTgYcK+Kc3V5xzj87DJFvzs5Zg5BYJ9dyHmk6+2/D9XqYUfnpZx81vD02gNd3NYUdUaN8xfnIBC8Fm7SoJyuLyGv8kVB+dtZAYyWmWRTrCpIs0r1IZ5qlCndg/jCzBw687kN53GryIo/qSi3DBtfzFNW5fVICFSK4prGfjX2FM3eKeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+4O5rz8YkcMXakY59FOWAZ+Tfpz85dSRNfNF7Rbr2s=;
 b=T+3lVjNouMYe7pXterf9vyhRRiitz+lqbgSeVNhzhp1M97onJ5u+oWN+uZwPRFbcvhRjjTwAY61Jfs+A2aSoXzbaJ0skeTssHwxTdwNSOI8F48xyPDUkyIIzaaDAxdz5lQWI35/JDnzlB0KpCw0yqFSby5NVXjFwaqyVan4D2cyGZ4EC27QTt/kQH5LvQWqcSbh4NyZvw20XDvMHgTDwtaHZZNVSl/gX4iZvpEtVeK2iLD5DgOoq4rm/aQh8jLz3oBGTYuMxMb6oPSF89ziAn45pcOlBkY14SOHrDDSJDXgycwv+YozIIquondt2WFVMMsEZIK0cBwnSBZAbf2PSgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:49:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:49:35 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Thu, 16 Jul 2026 10:49:26 -0400
Message-ID: <178421335540.3679675.14506765191534970486.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714143154.787825-1-alexander.stein@ew.tq-group.com>
References: <20260714143154.787825-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0173.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: d1001bcf-af85-44d6-0110-08dee349741d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|366016|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bSO+Z8cAl6UkLc/X3E3LiwOoEvBFaAbQ1vUnRFbgDHW1NNd6mgLZwOF5BnI739xeZ/rP66XgXNuXhF/efBXeRxFNLh69aHwZsCuUdrA5o1MAGPJYj0xVSGZfSpEx4aaD9Kw4AXhe0VHMUOvsYFLPXDNAX+x1EJTSi+VLPFkN3lJYiSJOGXbwklmS1KcY8xiTsr95ZtUn9/YsT8hsZ1h0emN5Bq8KawzEwgqc6aVHkY4IWdWnuZCPRDp+hUdAhilE5/Q17KszB5xXct2r4QhwSDAkYOWuOmIRRJ6vM1x10T0+E+1RDSUHMXEfavbimnjxDP3HN+LtyOoxHTzHuzNO5pmt4d8vZUedHhvJp1Aat7+tKTHjMyYddP0w+cczV0QquxUhT9QqBx6/ICiMkrAVy4mMa5gcPi4zESA2yyiFTKAQs9OJ8rs1dJrsFrtEt4LkDUW2C86TbSu3EVhIxSWFNhp47+F/2tdA3AiX9pgEW99MSfXRfZxcmzsllaSs/03SkcZZCVg8XpK35zah5n6TyGA7I/P1zvph3TNAs6M8drdmqWZFInKQCazjR0X41WWe5+EJ1tE0qUIa3PafinqqdCvzx5mfmQtR+EOc85dgkx1+HKUTTJCSdGSsPA0D/MYKf1/UfmcBlQ5AFKsropcBJ2UCA9Hd1qstQjtBDFgNVqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEt2bHZSZEIzWTZFSXJrTHRuUVZkeFVxMGRIbjRNL3JvRFQrNVNzQjBuRjkv?=
 =?utf-8?B?RXA3QXJlaHBPa3Bqc2N6SERCdmlJcDh2UDFUUjF0Z0YvTUlTVHJGeWo3eWdx?=
 =?utf-8?B?UWdRN3ByK2thSFE4L2ZhU3FUVHdwYVNQV0lsNXY2NGJyZHkyUUtSNFpjVHAz?=
 =?utf-8?B?Zll4amdsL0ltQmt4VW1KSU1xUjQzN1p4c3h5b3ZqY2JRMHIzV21VZEJzNjZD?=
 =?utf-8?B?bHBhWFJaMjV2dmNzL0phcFdHTG01a3hTa0tiaWlQbzJmVG02dUdQaGNMUktx?=
 =?utf-8?B?OFdLajNGRzV0OXI1SGsvS2VhdkNCalYrUXNEUVRFM3JSOFNlRUFiUWYwa21R?=
 =?utf-8?B?Z0QzaDlwYmZoSzNUaCt4UC9ub05kUjB0eUdLZ0NSY1JYaXJNTjNaNEZGZmtz?=
 =?utf-8?B?bGxUOXk4UWc5TU9ZQk5FQUE3bis2ZHhlMmMzdlZHcmhiS21Nd3FlSVdwc3hN?=
 =?utf-8?B?ZStKSGQxTWRueUJGU1JHVU1XcXAxS0VJMWk2S2tENUJ0MVl1TE9VMmpYM01G?=
 =?utf-8?B?UnVDNFQyVlM5NmhhbkY2TVZlWTdlUzdDakdwMzI0Zmt1d1B2Vm1UZmNTUkt2?=
 =?utf-8?B?M2l6M0EyK3NkcUZSRkJBTWU5K1hPd0xwWlQ2NHExTVRRU2J1R0MxOFh6RDJT?=
 =?utf-8?B?T2ZQUTdqWHZnOVJmdHJOUHNoRjdrVU1kcG92ZnVXV1MzWkRwdU1nUEFxNFJP?=
 =?utf-8?B?Z3VManN1a3FjVVFMTGl4VGEwNXBEZEdIdk5xY0lSMGkrbHFIT2xSeCtzaDBQ?=
 =?utf-8?B?UzZ2cGpPSWhaY1lMSmtCNWg2cGwraWZ1bXZYc0lndUFZeUk2bFFyRnlDd3h3?=
 =?utf-8?B?V1F4b1BmM1FPZWhiVDRiV09HTU1aK0wzTWRZRGlHL3lOSjZyWXU0bWRqMmtR?=
 =?utf-8?B?UVFmYUJVcXgremNUanBLVjc3Tzh1eTJoamdPVHdKS2VLTllGVnBETUE0blNx?=
 =?utf-8?B?THRVQ3ArS3Q4bmtLaW1NNktPMGx2OW50Y1lrSjVzTTBRV1dSNnFmUzFNdkVw?=
 =?utf-8?B?ZjdvNzJHT0ZBRzNpYURwWThsRVVjZ1JCNW1oWDNxM0h0TGthRDVnMXY2VDBI?=
 =?utf-8?B?a1NlU2NYcitNWGlPUFJXNWQ5Q3U0T2pzRzRtM293dy94K2lQakFEcFNPMjM1?=
 =?utf-8?B?MGllWG5nTjl0dlFMNjVXZTZhenYxbStBVlU2UE5yQ1hIM05pTXdhNitCV0Ru?=
 =?utf-8?B?WGhBdE1rUTBKd3pWQnJaL2U3emd5ZFhQNWZ3ZlNLMHZYR3ZjYnovTWJHTGhS?=
 =?utf-8?B?d1lmbndTZHBuNnVFamxsRjhuaUhwbExHUlB1L3hrYlhhUG1KZFBVYXBHamVN?=
 =?utf-8?B?QmVCS2NKWVJ3R0lnQ3M3bEV3d2xxZlA3QU54ZVVaU2FzZ213YWcvdDkyT1dt?=
 =?utf-8?B?SnNKT1UrS0NRVnBMOWdXbFZPV1NaM2JRZmM3MVRWV2JCQXJTTkhKVEdOdnY4?=
 =?utf-8?B?b08vRkx3QjViam8veTE0eWJTQVAvQU9Wby9PVVRERFNDYkRSYUgreEE4MFJQ?=
 =?utf-8?B?U0VyK3pxTVpFSWNjK0lRSEluMzBhOGxud0VaZ1FITy95ajdHdDNIc0Uxeit4?=
 =?utf-8?B?ZFZNTGNWck1YaXJwNE5lZmRGVEVwaE13S3l2QTVnL0Jha0dmaGtUZ2U2V1Fi?=
 =?utf-8?B?MTI2MFoxUlY1aDVwa1B5blJLQzJEVnBVL3B1NnNabkFDZE9FMFdlV3JEZkF6?=
 =?utf-8?B?NnUwVXN2WDZWQncxQXpXUFFXd0Z2MUF5WlpDYzFhSmt2SGxlQncwalIwVFp4?=
 =?utf-8?B?MVBESDhrTEtkVlVYWGFQZWdjZVRKMGgxSW4rRUJYd1N2WHNRdzF2ZDBzSkRN?=
 =?utf-8?B?SjZ3Q0dHby82V0ZkNjRtS1k1Qldzay9iWVQxTk44ZmJqWkVPd3RPc0JWYmF6?=
 =?utf-8?B?azI0N04vVGl5UHkwNW5oQzZVSTd2Z1VzaGp2Z0FmdzZ1cS9nNVlwMFplT29w?=
 =?utf-8?B?M0NvVm9Ca3JPcWJkcG5zMGlmQngrZGtZYVZSRHJ3ME9FUHZzWFhBZTNpeits?=
 =?utf-8?B?RFYwVm1PalhNdVRNOW5YZTFmRXppdVJoUk1uamJia3ZUL1VSUlNWZklycXlm?=
 =?utf-8?B?MDl4TXBuak45aW9haktsc1lXNWNqZEZFZzFIWlhhOFNCVXRhMjZyV05iWHd6?=
 =?utf-8?B?My95U3JUaXlLSFBVbkZPM1pXWjUyRTV2NjUyZkU4YytFL2RxV3J1OVFLcldD?=
 =?utf-8?B?ejZtTjdiVkd3S1Zhd0lKVzE5dXJ6L2NyMmdWRUJWOFZBR1dkS1E2Nno1eEgz?=
 =?utf-8?B?YkZhQVNhSVFIT0ZQbmlBWkZTajhCbzJOUFRKTGcrSmhRM2tWMkRzV2JJMkVo?=
 =?utf-8?B?QnBMNmpPeXNNVDRvOHdOV3JJYnVEWlV5M2hQU1R5OEN3NGFIVXBNdkpGNDRP?=
 =?utf-8?Q?dD/Xi9H5IIIWQmxxkJ0PxU/EAs26MIqGWlDCP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1001bcf-af85-44d6-0110-08dee349741d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:49:35.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4B6w3lFByIz9XLuTAXxBnvLP8hp4cqb1aAw+h/13n26CNXM8ju+pJXEiSnCA9tTfuVUjfJ4kH0eOCun6Ndhg9uu7q77ppVI9Fwv/zFlEyvXPXB66g8hASiyWLVGr6B4I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948

From: Frank Li <Frank.Li@nxp.com>


On Tue, 14 Jul 2026 16:31:52 +0200, Alexander Stein wrote:
> This adds support for TQMa95xxLA modules, designed to be soldered
> on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> design.
> 
> There is a common device tree for all variants with e.g. reduced
> CPU core / feature count.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: add tqma9596la-mba95xxca
      commit: 4185d10a60d617c5ba7dae4cc56498621c11cd00

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
