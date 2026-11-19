Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079370;
	b=eZpKkawqZ2MReB2IU9AR5x/fcYzzmt8a5cVe/z+0vxCARf4fVGklJ9R7pYSv51txkqgd
	 H12FSQVJE2CVMN0LTRdPjTG5/v2Eu+JUqiU1aJTIOQUv2yW6omybdhy0NjmPbvuVpIPd+
	 sGxPwP3j09nW+XHXdz+tlKqnjrjxy5GhnCUvZhI3RTy2wshndVa4Lh4w98HEO8TavWbfW
	 ri9c+oQqhVsuUK5t+Kt2omRXGnT6KB0NIbb2NMk8E6xjKA5STmXuLcrMDbQnoWRBMNjht
	 XsKqelQfk3KckkkvQoGPbFAYbQegxMvVWd0Jza44AZeGvfOZpwIBJfHlvBMGWp6u7Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079370;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=J8NKeHYORPZ3K/NkArMq3zhr150TwWCOcZCTTvlKrrY=;
	b=VvAAPJlSlekXpwbK7sYkZ3/Tcc6689a3FVEyPPSlgOf4L4TR7iQO+rROl6D2hzsum7Az
	 bYDAOm9jeA/Cip1SL26GYfDXWzf9gZ1Tcj04GpIw9W1VFRiyoyWrZSaar5ga+ljQvgSY1
	 SxENVSeoQwJRW0QX8WpcNXKMccgVwFKBP+0YwKbOtM9aN7PEGJrqdsVKFFZUSIhMd7RyL
	 RKSJVyuxMH1rrDgrs44kLFpZgo95eKvtv6A7+i/d0KxUO1thPyAvK5jLeL32VsP5ovGS9
	 zWDTB+lymQEOj07KcAOVYqdWro3BwJy8MEA4q2vcW1Ja+rXAN2f6F1OtcmdfRqRm1kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=huJehGw8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.38
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C460606A335;
	Thu, 19 Nov 2026 09:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C460606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=huJehGw8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrR3Kb4wQE7zF0dpmxM4EBLTbDRL8PH8ZtQrmK1E2KqjXemGv+u5uPjDT0DiK5GZgIrGRt0iJsVe9DOXJuj8Ghn15WvEU1W+B774V295R+BEylUYUGEL8yvqMDAgKKfdEWDSmqgbfqwVVI+Wyp16DlM6My0EXLdJWc4Zu0PPSq2qt74etAWphVM3HV7AtEjoQJhrKSxeRyjBgw46gH9ShPYDL7ORELIg2LWxF0EP5zCLEbJhf0H4mtG5oR4AXqMLyl6GNkFBD3MV4zCAgPsD+rcwF8//zMO+HyfyqP34RPj9Y3mnKMZyTvM3D++hvdL5HJmHZbWVae3o3Zu1ss2W1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8NKeHYORPZ3K/NkArMq3zhr150TwWCOcZCTTvlKrrY=;
 b=adkTgL7pDGDeZYrpDgkDn8iWGCk27BD5L3af8ojJ5lKZkbRNs6nj+kdfEcNp8ghVcYmXx7D9WpvY/2ma4Y/+ZbLAvXTkSYC8wNbr2iXB4s694XuzUMxHWDSWlatiJII2IObssaWQpYE0b6VAhy7HQF448y4rxh8y803F5MZ0I6O6iNVUP1bMF7YWADws1TJ2HPokMbeGBIJ+MB0M+dblY2WSXRCsPv42JwYYHkAxX+FclWgzouBC+RS4eK3L7UomB4RCibjVnaAniLfZFFmei6cyrBqp9jx7Y30s0W/FHnfKY74xblf6HNaXPzTWzSfrjMzSH52AeaDzUKJ0QKvsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8NKeHYORPZ3K/NkArMq3zhr150TwWCOcZCTTvlKrrY=;
 b=huJehGw8y3zF5+yMrtrWLujx7T9RCxLRFNvYeXJ4nMa4LWHiKU8KO8CpIP+PM+gJw+EifrUPwfr73HPzn8chwgYOAX5NrnK4l3SyzX/Wa5zlI0jFVBYDj64lnUly9YscgIEb3Z+dn0T2v+WdlnFHyaqjzOVsS2FGP55Os1qd6K0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by TY7PR01MB14779.jpnprd01.prod.outlook.com
 (2603:1096:405:24f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 09:09:24 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:09:21 +0000
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
Subject: [PATCH v2 0/1] Restore RZ/V2H(P) USB2PHY reset and VBENCTL mux state on resume
Date: Thu, 19 Nov 2026 10:08:16 +0100
Message-ID: <cover.1795078440.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::19) To OSOPR01MB295138.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|TY7PR01MB14779:EE_
X-MS-Office365-Filtering-Correlation-Id: 405b10ce-6fc1-4d20-7953-08df461ccc17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|261009223027099003|11063799006|260925022911599003|260925021311599003|56012099006|260925021911599003|261102123227099003|261028144727099003|10067099003|261021121427099003|261026140227099003|261022105027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	j8RLFMCuevIFMHRLAz0FZTRSRaoF+hz+qJ83Qxy/Riy7If99tZHCTNg3Sw+MWQ+CJ+SGYWR1GVATaUhZ1ZpwJ5RnPOJynxxpyYm3vPVrfRpj7LyntvQe5kfRkTqswZkESV7WnvUiWZ9aMLPyCcxvd9vdoO/S9iraIIHRjS3H/5p8pPI2CzOsGlQYQJ5wd39ZyN+XSNnNAfnKoIKESmxvkkTMgfPF/FKXCRjn8oUMbA0+Ja6HSSITw0/pIvWWFSUCdYM1wGfDoDyMPcZmCgK7ybcxlZ4KzD88MAZv+tKFU93pmFv4EIPsayxfhpX7f9kv/y94Cq8Z+HaWgzU50E98oABFVSl5NttvEknwL/rAUAaxV5VuRpDUFA+rQCXxRuMnqUEQU41XjfC1pJ0X/5FUr7+d6heAbGZVOFkfeVPHRpSD1MPVIu14CPCAia21GVqTToBMdxY+C3IVwAjnvXRXenwGRvEaHBS9G1hp1ltkKyvYr3cemd/N3YD7ByoTchNHL253romDnIeUtLv6ulpZgVj3nRZuBwh2Ws8IIExFH77mdDt96j7fpQf3mX8udp1h0pJlDHyITVwrhyrZ/glt973jpgv6nOpo2ZCMeKO56CfWHMCWfJHI7WiubfU/fPY+Cs44JgPh8ERV+PRVFtAJTOuxbj3RSFoljmmapAcMqJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(261009223027099003)(11063799006)(260925022911599003)(260925021311599003)(56012099006)(260925021911599003)(261102123227099003)(261028144727099003)(10067099003)(261021121427099003)(261026140227099003)(261022105027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlNsejZLRTdoZEZCZWgrZEVZRXBtNk11c0F5cmt1TTN1bHdNMGx2UFh0S0Ja?=
 =?utf-8?B?OHJsMTB6SGtEVVR0cnNDS1p2QVRES1MxMnBuVDVBTTB5bzZFWDVBOEpjUHFv?=
 =?utf-8?B?SmpXcytMU3B5QUlHbWRBNEJpeC9aK04xMkFSVk04YXdOc085eWRuNFZTcTJ2?=
 =?utf-8?B?aVRTL0hQQ2szRVRteXkyWWJxVm14QVFDMFhMWmFxRE1WUzZYL3lJNVZLTjZz?=
 =?utf-8?B?TW1IMWV5RVNycVBQenN3RTRkaFB6SXNjdUZHOGcrZnEwZ3dNRktPNUdKYW1B?=
 =?utf-8?B?L2w4a3ZxdjVsZWNsS1N0ajFiODhhdGhiU0NSV09vUFZpS3FBNXdjdkJQOUVE?=
 =?utf-8?B?bHc3SFNFMDJ0SjF0T2ZERktFempEOS9TYTB0Q3F4cmwybkVjKzIrcHlQOWU1?=
 =?utf-8?B?RGdyQmcza29rTHVNRi9TcUhLSDNzVGhna1FXSVJiVW95UnhoMzhoT09FQkRG?=
 =?utf-8?B?TFRiWEtHL2FXWVBjWlhhdllkOEk3WTRZUHowbmFSck1XR00yVUFVQkJOcmtJ?=
 =?utf-8?B?cjZIQjBrL0EweEw5SDJmZ1RaaFp1djgwYjgzdTZIdHdxajh0L1ZicFhWWjhY?=
 =?utf-8?B?V2pIMFNZeVZSQVl4c1pGZkdTNEF1L0JvWWNRb3dBYUxva3BVeGk4aTdxUFdR?=
 =?utf-8?B?d0ExZys0d29rYzdhMGdocDlFT2NWNWlMb1BXR1kzTzVCNkU1K1VyNkZOSTNm?=
 =?utf-8?B?R0JwM3lmSkJMY0pFMGUyM0pKcCt1UVJ6cTQwdWlkZjBCdDdJN29rME9UbjJN?=
 =?utf-8?B?N2daa0JmUjVBRlIzc2ozMHZZalFBUE9YdmRib21JdkhwbGFHbDA3ZWIwVWhl?=
 =?utf-8?B?eFVaN2dpM3BPV2UwckZPcTNEZUNrNzdWKzhGVldraFNBUmQzbnk0eHFwYzB4?=
 =?utf-8?B?RWEraFhCSi9xK3hocjNBS29WSzA0bzhmeDhHdzloSnh4S1I4VFpEaTZKaFZY?=
 =?utf-8?B?NmJBQ0ZCRE42MnMza1ovMUx1SzBkZU10Q1dDUHZxemlRemVmeVg1T1hhQnBw?=
 =?utf-8?B?ek1tVXg0U3lYRlhnMERzWEFlNmVvbTZJUmErc2wvWGlIOHFWL3htZHhTdkRS?=
 =?utf-8?B?WDBFWGJBc0I0d0RaUjg3dDBJbmwrUGQ5WW5OZytnZ1llMjZHN00rYWtUOTdi?=
 =?utf-8?B?dHN6WVFiTkZQZFNOK2NQTWM4SDNiZ0hDRndUb0lVNnVWRWZLQklmUTJ5NlVz?=
 =?utf-8?B?VjRFS2xiMEZsYkM4cWxCcHRWTXUxTUsxODc4TUlHSHh4K3pCVW92WU5pVml5?=
 =?utf-8?B?UWRkNS9Pd0RIT0hIVm83Y2svWVdMV2Rpb3Jpdkp5TTFMMWdsYVBFemhQVWsv?=
 =?utf-8?B?NmtmWk5jQVVRVG9QS0MxTGNaYk1EaWE1NTdCV21qaHFKTEhXc3dsRDVMKy95?=
 =?utf-8?B?cVZHN0MxNzVobyt6a3VRaGd3em55Qk5NaVFQYWt2ZnREOGg5MVAyRDY0V1cz?=
 =?utf-8?B?c1ZIVXJYY3hON2hVNys5SHlGMW01NWpTdTU1WEwxaXlEckVZOHk1QVM0UlNW?=
 =?utf-8?B?ZUdMZnM0WTl1QWxUaVhEMitiU29FdjBkM0Fuek9UYmg2WlFnS3gyTVJyWG0y?=
 =?utf-8?B?dWIySzY2RVFTN0dBVnVjOXpBbmdIeTJQVi9CMFFhdVBoc0JWVXBwQlViNVI5?=
 =?utf-8?B?d3VhclZlVFAyTXFFZ2JPMGxoYWdaRXk2cnVJTzcvK2I1Qi9RcTlUMGpUK0s4?=
 =?utf-8?B?NTJlbW1PTnBvVmJQVEY2NWNaNUIxcHV3WnRoWHZ6UEVLaThlN2YrRVhpSnFD?=
 =?utf-8?B?NG1BOXAvSkE3TDdONzVNdFFhSGk4Nlp6RXVWaFZ1KzY5c3FtNnV2Z2dreFIv?=
 =?utf-8?B?N2ZHVlRrTWlvcEF4bEkvRjJaSEhUVThCWU01N25PaGJ3eHo4ekRMSSt5c3ZC?=
 =?utf-8?B?L0lUQ3BWV3JDOUdpN2hxM29la1p6UlJreGxxdVBiWGpaZnJseFVZVDIrVnAv?=
 =?utf-8?B?aFRwNXErZXRlNnZjSi9jQitadWU3SlVBVE00a05pbmhXVGQwd016WHlJQjEy?=
 =?utf-8?B?Q0cvNDlYaE1pekc3clJTVy91SzJ0THdwU2FWRE03SzhFR0FyVUpZajZJd25X?=
 =?utf-8?B?STIvcW5RSTV6YWVHc3lDZkJicUd2YmpkMVlJN0o3Q2RLaERYWExacFgwUmNB?=
 =?utf-8?B?dC9vNlpMTUlVZ3ZRNjhTdEsvRTYzK21LeDQxM3lNUTkrYi8ySExiWjJTaGFp?=
 =?utf-8?B?ZUlSek83ZEU5QktZNkQxemtuM1hyYmdFU3puS3lyckZ4L3hxdjJpZXBXV3dk?=
 =?utf-8?B?cnN3MW52ZE8vcFJCZ2J4N2hKWWZMQWlaSXhCQ1NQOURub2Q3MWJESXByL2pz?=
 =?utf-8?B?dUlvSjBiZjU1ejhSREY4U3NYemxqbXJLdU1UNFl4S1dLOTdWbldoSUhPT202?=
 =?utf-8?Q?YgttC4AZzmH8sgomexDfL9yL3kpZJHLUQV8RL?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405b10ce-6fc1-4d20-7953-08df461ccc17
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:09:21.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9r04pEOF+1+87tdpehY7SmvtGUb6Lw6ZUC32n2IoWAzcuyy5jtAjUo3pFkhuwYMap2JEfUDmqhKXGtTtkoyqUY5K8vAj7KuWDirGKxSvxaOxoAF1SST9CaZ3QY43raj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14779

Hi,

This series adds suspend/resume support to the RZ/V2H(P) USB2PHY reset and
VBENCTL mux drivers.

Thanks,
Tommaso

v1->v2:
 - Patch [1/2] reset: rzv2h-usb2phy: Add suspend/resume support (has been
   applied to reset/next)
 - Collected tag
 - Rebased on top of next-20261118
 - Link to v1: https://lore.kernel.org/all/cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com/

Tommaso Merciai (1):
  mux: rzv2h-vbenctl: Add suspend and resume support

 drivers/mux/rzv2h-vbenctl.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.54.0

