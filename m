Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079518;
	b=H+hyyrM8l7YuRqR1djiTkBZ47iQPwIoWkrxuo5F6BK5zfwj6+Ef4bZUDOQ9jX6euttJO
	 Ow1EhppE/LMYaIGPcKU+vjZ+e7wBVGWNtXzDZU7MZkLyjFYKtnir4ku4dXB0lBkM168tE
	 ciNeCecMfbVwpy9+bN8Z8QPqDOibEPsL4a2IntXsofIPuGVYPhGmLkORKSSqDAG1HBbgT
	 s8toV8PWLhVU8hEATPuVAZ9HT0nb7kc7KHyqSoVNFxBvFvQmBK01A43xC2JTgxy4Dsf4Z
	 xNsslqFyTW0TJm7fcGpJ9yvSNUsYgvsjKJjUkMtt/3JcoW8c6AzQ7hJmUWwq9mSZ1AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079518;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NYQmVgd4fhE07G3p1/TZVUCqm62T1/OcR/0t6ExsQf4=;
	b=D8wkJd+lGMnh/HSHMOxdgjRSXdsUS2gL1k5/KV5jM/qzxUWfvUb5eJN2tcQHlDLW54o6
	 TBgW9FD1jfccIMIa4pYAAfRw5e9BXSrWI3LZ2LVKdknW4wfWVkPCpa/WcaguXNEC9+/Ku
	 ICWlo1rL9UchI63pB8FIOZJS2JjGoodU2q8Dbsp5d34GBEqm+MBRhwSgaoRNaT8oaDB+B
	 +D6dTUAIilbOYn77zNg24H7he9v7ePMkCOpxs/J7XaegGdlRf/jbqdTavyjQztT+pjO8f
	 8EAuyEzW4euhtasLYfv6RNY63EUJZ8rTL2Ss3EejPGtcXf5rkhy7PZFKPJZ8ohksaYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=EIyNank6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.64
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FAE606A335;
	Thu, 19 Nov 2026 09:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64FAE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=EIyNank6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGg3DF+4oN7ODKoNZEh+3tm0dTFtXeaB7Ge2xfcTjVmJvxMMNNUmiBck5CErdJNFsroLhVRtf8FhxO29UYAYHxl6obew20jOAoY8qZRszcDQa2/fhqMjR07jnkir2DRJFtAJ4NremhPoGGDFQnCb+NPPlKYuI7MhJExSKGOEvTvorqBf5w+m8LVawKcDlSXH+HQtcGCO88QlVl2pI+jI1i4d0tS9HW8quVm5uMBRUhbusFW9t4rSRHCDNtDpNN+d/qGQjGPZ3GbfDOvfKpBLNH9vHKp8eyIJUtqlon4ZJtk6vzpVDclR+LbuBObUfOzLXOU81Y0l7sOuFEzvgpZ3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYQmVgd4fhE07G3p1/TZVUCqm62T1/OcR/0t6ExsQf4=;
 b=MGMN0dYfTMo0JGf6F9+Gp/aBNPbPx7U0hh/mjbfiOkpvXx1SOQ6lydOUr+47v9dpHn90wuubGRJK/r8HSwB2LGhzsKUC5yk+kIfZR0XlrnMHs7g8sfAMDJr670743RAlXDP5GLCh6AzRkeHLKN6uwtc96yUlKoUkkKlUMOCcFE4xOOzpUEXgYZKulBV3sAZMvOAfyn+OVCWVfEGARKUDPIFWfQgbnvc1VKfCtLDNzGeHl3GTn3tPfpOvgYtSiGmyZAcm/m1os0T0VfjLdAeDD+EW4EmEZLac9n4j7qKP6GbCt/rIFtiDceNJ/S+xCc6TiuZvkZkAwZB/USQGJs/HSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYQmVgd4fhE07G3p1/TZVUCqm62T1/OcR/0t6ExsQf4=;
 b=EIyNank6CmuZyU0NuEhKOp3Z5Doea2Kdxt4DL89UkgMIIqmf71vLAfWQ2Sc4aaDnA3371GEhgnxhv47fZ8FJ2FOMDgA5sknbpO7Vhq2T0AlTmLSYqmbyxxe2GEaju8JmBlcDZf1+tx0SCnIZVTOccWDwYyvH2THA0JBnspFf9e4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by TYWPR01MB9572.jpnprd01.prod.outlook.com
 (2603:1096:400:19a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:11:53 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:11:52 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@lysator.liu.se>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] mux: rzv2h-vbenctl: Add suspend and resume support
Date: Thu, 19 Nov 2026 10:11:24 +0100
Message-ID: <0792bbd48110d5cc2c53ab67d8c8bcf6a02e1a74.1795078440.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1795078440.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1795078440.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0548.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::11) To OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|TYWPR01MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ed4afc-74d7-4a8f-b3e3-08df461d267b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|261028144727099003|260925021911599003|38350700014|10067099003|260925021311599003|260925022911599003|11063799006|56012099006|261102123227099003|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RU3Z+4zFok1P2y5MysqnDLT2hdyYKZO623/DiLWmnVRaWdGDgRXEVc+SnOxM5MHDMmUrqHAWrHIUHamx3kcZ27r9y09pzGN8Kcmgwaf7bHtGc6TdpCCJ73fQ5XYm6MdheWmPWNuRel+vC99PZ4B5tgZhsxlVwzLj0+0AFxrx9aHw4xHkjdFCQYLqirPhtZRyVB5fVLyoiwiA01PpKYHHaN/wdC0ndfWGhQjPEEusOVGBqjB599OIH4TNqV1h4cW++KHEfSX9vrxaUITlb7m+ZIoSkKPOhS1bILH6MvjQhDJbHHVvBLpN4IpF8iDvqMAQNDqULt/Zi7R33Jej2yF1pL3zFS3Cd8c6XMcFfMXkSmwNJSfbtWmc04+IMnoWMR81CyvE3dt3qNpCd9qu6JrfDWWB4GP2ebfYgEMDOYpucFb8iW/VxgL2pqWKpGxuwuL+Y+IkOG2BGM7RiC1e0kUCuFz0rSrIuFDix/Wj+Y/cEPkB4jgQpYIYfanPWZl/MZQfuyHzkkucwN6MVF3v7zBCrKuZi7mceGumPow1VascpnzWYetUtGc0tllOfgNgITmaZMkS3zQKDCUYFhHIWeYWbUPC387YJWENbD5G+Tg9wDeM2rKuPRb2jog1uLhrVq0WQUZOCqqz07NVxmaCzjAKkHx+FZmqBZ1+9/Wo5Rw0+vvBmBcPmFOn44QGW5Up6/0YqAB0FnU5k4Ydx45gsdl9hnPt5/xvm+ci8x+/G3NipC4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(261028144727099003)(260925021911599003)(38350700014)(10067099003)(260925021311599003)(260925022911599003)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akJmZVhHTkZNZHluamNodmlYOWh1eWlNSEpZaVhCVENuN2ZqYkJ6ZXdvKzB4?=
 =?utf-8?B?RVJ3TEJ1UktJSjlYL1hEQVFvcXU3aDIrSy93cGF2ZEN5bmVyNmRwV3htOUFw?=
 =?utf-8?B?VDJWMlVvQTdKemt5YS81dFI3ZlVYSmpnQXNJTDZiT1I0a0N1aHIxSjZKZUpC?=
 =?utf-8?B?ZExUV1djK2hlLzVuNFJQVDFMbmVBSVRYYU1Ra1pGc2NydnkwaTFLbkVIOWRG?=
 =?utf-8?B?bWVoZ0dybU05NkVuU1JYTjVFTVY1RE9rV1RSNHpiZmUvNlpJYjZLMmtENFJI?=
 =?utf-8?B?UEtnVlA4TGxRSUxjUjFPd0FNZ0F6V2RwOTlVeUFwQ0gzZG1Jd1Zqcms1am91?=
 =?utf-8?B?SmxvME9pclpGN2hBV0F4WHQrbWM0WU1vTHE3TlBvenY3dHdRUzVXY0UrUC9X?=
 =?utf-8?B?aTlNSkNpMEs4TkkzTzZySWM1SGhxUTYvd0UyaHkzL3ltajVMTStudy9UcUlW?=
 =?utf-8?B?WVpWUThvb0pvay9rb0tJREFyYlo5aEUraUorWUsyOC80VjhMdHZEVm1xZGVM?=
 =?utf-8?B?SmhlT3dEQXdla1dKb2h4VkpnbVlxampYdWFqYldSWi8zakxHaTQwb0NoVmEy?=
 =?utf-8?B?eGhtTXNNeDNuQ1h0ZG9uNURsZitYVlR0MkF1Y2I4ZUJyZU96VEtrYlFIZlpw?=
 =?utf-8?B?MUNwSEwzc2dZNU9QSzRYQWdwQ0JGelEwbTN2TzFzOThCSmc2RzNWRjdvNFhO?=
 =?utf-8?B?dHd6SFFhMGZ2S1A2cmRubG5wQ1ZRQU85WEJzd3BTejR0cmV2L2hUUStxMkU5?=
 =?utf-8?B?RXpqNHhMZUUxR1VOTW5IWnhieTFkVlhkT2tKWlBhZzVxRGE0MnlCM1lTVHBq?=
 =?utf-8?B?eXZ0M3huSjZ1Zzg3T0I3bExPTXFseFpUeUlQUjBNZktER1BrMW5sODRmOFN4?=
 =?utf-8?B?dHVYMFNEUFh0NTNUcUdiMDFPSGdidzhJc3pMWE1ka1Rzd1NLYlhITmNjSTVj?=
 =?utf-8?B?djgycllZa1pjN2lZam9lVFNCbi96Wk91dCtiRGs3NndPdWl4VjNweHNGOEp5?=
 =?utf-8?B?anlwMzEydFN3MUJrbHZUL2ZVVzQvM3FxTmJlUHQ4KzJTNmlQcEJRYklCWnIr?=
 =?utf-8?B?dTlRZFk1S2t5ODNtU3h5UTRIRXhTYVlJTTlOcHZwZHJjdFRZdUpHT3ZMNjJP?=
 =?utf-8?B?VFdPU3NnOS9IVzU0RHpLOGVsc0JrM1NHSHFLZVlaOXo0ekh6dnE5SjFrWkdS?=
 =?utf-8?B?NmNHQUdBV0FCZWJVRUl1TVhSLzI5bG1TVlcrRVlrdnloUDFnckVRQTl5MEwr?=
 =?utf-8?B?bFZSQzdOMSttNmRIREFMWWpEd0cwOVRySVRaZzRDWUxtb2lTaTh3Tk1VbUR0?=
 =?utf-8?B?ZzNyeUw2SG9yc1d0VnVwbndVR0pHT0NNQVpPcnBXb2tZOC9PTlJvdTV5UFZl?=
 =?utf-8?B?TFlqbUdISmFTVllURDRoT1M2b0hKbVVmbk9lbUh2WXByRy9OalovOUd1NVVs?=
 =?utf-8?B?bTZvVStMVlViZVN4U2R0S1U1MnprMUwvWXc4V1loVVVPMkw1V2lRNXZJZDVv?=
 =?utf-8?B?R0pheEI1QldvNCt1QzJadnJ1VXFpT2xIdnZhMXQ5a2RNYkw3OVFJbE5td3di?=
 =?utf-8?B?Sm0rZkFwaHUvRUJETUh2R3U4TXl5YmxoMTRsYzBpdHFzMEI0bnh6cVVMdkYz?=
 =?utf-8?B?V2dyUFdvV2tnYTVFNDB6Y3p2TUtvRVprUGplQ1hmWXNQZ2pUL1RvcXVzOWtI?=
 =?utf-8?B?M0xLL0F3MjdkWTVDSUczbVVpWFNHckZjdW9VamMrWFZLeS9xdzhBU0d4UVFW?=
 =?utf-8?B?UVBYdTB2TjRiSnlXOUhTcmtsMDBGcjZMaVozaFlDelA0NEhnWGk4dHNFVkhB?=
 =?utf-8?B?Z2s0ckE0VHZ5VGhEUW55bGl6TGN0K1RDV2ZVWkxxdVJxVU5FQW42bkNxUEdm?=
 =?utf-8?B?VGJDTU9wRzBpM3NZZ0FUK25UeFJrUVNtc2hOQkJIclVkME9TRjk2MjF2UEVK?=
 =?utf-8?B?ZWhNSW95VHlRWjdqV3BLdEQwRXBGcVJ3dFp3UWEyakxSNlp3aDJWOUlFUnpM?=
 =?utf-8?B?M3A2Sy9ud1ZUZk1vNEI0RFJVR3VFMmhiOFkvTVc1bHlrei9WcUNjeVBYQVJP?=
 =?utf-8?B?N1N6UHZLY0lpNTJLZS8rK1hOMXplbGdsUHpWMm9UcytNQk9EWm42ZmJDZllL?=
 =?utf-8?B?bU56ekVZU3lnWjlhdis1SmQ3L052M2JMci9TY2tvTHRIV0xmQjdPUzZzb1lM?=
 =?utf-8?B?MENwMEpYU0JoZXJtVGdVSi9KbTdiTXdWc2NxSG9reGRjVE5vTlZseXVabUxp?=
 =?utf-8?B?bXdsZGllUVFxaUZtUjZuVkVCY3N6bEV1YzJKQVFuVDhMYmpOVWRhM1kxb24x?=
 =?utf-8?B?eFdyNzBZSXJxYWZIT3dLNmtaL3lNaWphcDlOZlVLQ2tHV3FncGRCM005TSs5?=
 =?utf-8?Q?EyD8FQLkioJenlsD57ghqqjBTkXtaDKU2yaOQ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ed4afc-74d7-4a8f-b3e3-08df461d267b
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:11:52.6622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qZWGNR8j6aqbb+tUOxLZ09S297OWVgN32lMJS5bTu9nqdb+OgIA0YQVbDYnwN5W/wJE+lwWj14nqGufOUsBQah6a9YONXT5SF69leijPkSxNCFpRw3nlt7am4X/Is9t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9572

On deep sleep the USB2PHY block loses power and the VBUS_SEL bit is
cleared. The mux state is read during suspend and stored in the private
memory of the mux_chip. Then the state is restored during resume.

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tag

 drivers/mux/rzv2h-vbenctl.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mux/rzv2h-vbenctl.c b/drivers/mux/rzv2h-vbenctl.c
index 2699458045f3..d088ac3cab2a 100644
--- a/drivers/mux/rzv2h-vbenctl.c
+++ b/drivers/mux/rzv2h-vbenctl.c
@@ -15,6 +15,7 @@
 
 struct mux_rzv2h_vbenctl_priv {
 	struct regmap_field *field;
+	unsigned int hardware_state;
 };
 
 static int mux_rzv2h_vbenctl_set(struct mux_control *mux, int state)
@@ -60,9 +61,29 @@ static int mux_rzv2h_vbenctl_probe(struct auxiliary_device *adev,
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
 
+	auxiliary_set_drvdata(adev, priv);
+
 	return 0;
 }
 
+static int mux_rzv2h_vbenctl_suspend(struct device *dev)
+{
+	struct mux_rzv2h_vbenctl_priv *priv = dev_get_drvdata(dev);
+
+	return regmap_field_read(priv->field, &priv->hardware_state);
+}
+
+static int mux_rzv2h_vbenctl_resume(struct device *dev)
+{
+	struct mux_rzv2h_vbenctl_priv *priv = dev_get_drvdata(dev);
+
+	return regmap_field_write(priv->field, priv->hardware_state);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mux_rzv2h_vbenctl_pm_ops,
+				mux_rzv2h_vbenctl_suspend,
+				mux_rzv2h_vbenctl_resume);
+
 static const struct auxiliary_device_id mux_rzv2h_vbenctl_ids[] = {
 	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
 	{ /* sentinel */ }
@@ -73,6 +94,9 @@ static struct auxiliary_driver mux_rzv2h_vbenctl_driver = {
 	.name		= "vbenctl",
 	.probe		= mux_rzv2h_vbenctl_probe,
 	.id_table	= mux_rzv2h_vbenctl_ids,
+	.driver		= {
+		.pm	= pm_sleep_ptr(&mux_rzv2h_vbenctl_pm_ops),
+	},
 };
 module_auxiliary_driver(mux_rzv2h_vbenctl_driver);
 
-- 
2.54.0

