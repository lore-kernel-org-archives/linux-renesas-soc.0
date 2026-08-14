Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA34305670;
	Fri, 14 Aug 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698031; cv=fail; b=VlukLTXQk4SQzaDsToku2OAtBuMH3gIRGm+XTCP2Dz2JX6hB1WTNB4ylfL36L3AIyuZLt/kO+Hd+0oETH0FFXi2Ws4GreJCeveEZIkELTohzIwPDaybIAgSNIVvlwcf6skimQMK90B4tFtqfkREAMlyqU39gN/CZFcbrMUwIArM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698031; c=relaxed/simple;
	bh=hDqWAG5UrpVWI1pDijk/qTI5LpL2Do70KycTer/c6CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WnU7VzzQ+5aXSYzxAtrfuSt5o2H90t4MEGeScjDe1erZbnkawN25uaQ5V8vuYZSvUj76vlk6MGtMBRvuMqrqwv49/9jpBsfvuwt7tViwy5HI5KKyibdqPK5QOgtLmyNQXQ01bVEOjRLS86d5SUpfbLILGfc27zytz7+uXJBC7dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j91L2oA5; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j91L2oA5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXPuARuKFx0HONqEbcR65TCN9MDTuOL6UL/LXB70nQNBDm+1lPU12YsqPCO0owNVO6xfhTBb5hbH0stSy7KhD2ylop5SFwcR2IeymS6Llnsb7WElPNhq9T013d3fvl7ImqIIhXTwe8PZw74LDwC4D02+bj3XGrxKiz8Npus9o3bvCvt1zjRU8Mn3Skekr8IRzZv76LV/uUzlh+Kwl7AALsFgMhlac6uFdarKV8ndqpfNiknNykrQu7eYa4vrEv1h4o7JGPUt0zg7dDd/Ff7BurjpUcrGONwf4yPEm49TfVLN8dY+DEbthjinkUO+UuM0QCHAyaHq28lXHjbaNP6zLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xnin8bgkDf8zMM3XQOA+ABYNFDhGCDcL5BjUe4yUFs=;
 b=LhJ3QMuGJXOWmyS8s7WUKh5oPUNrxk9yboWxAAl5EBATdNn63nb8mC5pEfNG13IXSVjU4gqn/oCIb8WZE5jRvkgzWKBs/ilnALcpteSO5qQ99XPDVX1Xpl0EapWOAqaSwDFbxWOf011fL/VEGhpJWNz2PCc70YTUjDPuhHmhG4HPPHlgrNypvmoKswyGGGjz+p6+Xew8eXb4dHVFq+pQCasaQgeN/jwdQDrWz2Vi3DvD58SNLNDcgZvoalBNtib4ouoyPvWkcKG5IqVtsGcWfXqtxVMyJkBtjNKuSjfdIi/a4CSOaK6gekHpzJNPzxtcI9MOdwWpenR1KD95vR1Cvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xnin8bgkDf8zMM3XQOA+ABYNFDhGCDcL5BjUe4yUFs=;
 b=j91L2oA5FoN5sEBdF4ndnPpoWSeKpSdml8HPahxQlKoeJVfaClPXRuvD59jZ+tOeYWluX9wmFWoJvWB9YzanI+lXjHmIskHzIsH4GIa35HsM6JIyariMO/kl1QDIZ8T7libBveo5dWbbtUj8IUaP54XJap7Rx/YXDNFVYufHwYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY4PR01MB12615.jpnprd01.prod.outlook.com (2603:1096:405:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 09:00:26 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 09:00:25 +0000
Date: Fri, 14 Aug 2026 11:00:10 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de, ulf.hansson@linaro.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Ulf Hansson <ulfh@kernel.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/1] Add USB2.0 VBUS mux driver for RZ/G3E
Message-ID: <an7ZGtf04lmtGZQU@tom-desktop>
References: <cover.1786347402.git.tommaso.merciai.xr@bp.renesas.com>
 <39f7e422-a629-4ac8-922d-ec47eb7d838e@lysator.liu.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39f7e422-a629-4ac8-922d-ec47eb7d838e@lysator.liu.se>
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY4PR01MB12615:EE_
X-MS-Office365-Filtering-Correlation-Id: 46600f70-a0ab-4dd7-c60f-08def9e27b1e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|22082099003|18002099003|38350700014|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	bf3Xtvfh1XGsDlmqCiFSixGIQwqGCjDhYJk+dJDlr6d/aurTgEnua1Bu8Vl7Fikb3QpHylI8J/BNX6T4McIJcl+FDGj3Db07sOw13PYj4UkTkdIk1yGGbZ+ECH8QXmcV2K1ztXr68/H4Ce9tGbTZEms6cRzvFe2+M4pm+hH2wOISOwuZdDRPBdidOZRWdjA+mzk3QNlW3Q7vaBdFRw0lbJ1THU719c4urXCPGnGMnFMltYesP3ru4+uV+ZyZsBCbZ3PGkyR9fLnFXecU7si5ztX4X/bmovdZdxMctQAQwDzCM9jgtTpGWr95xQjyJqPci4DpxXhdW/5jar4LQKUPbF1kGZdhALRxtXVVN2N4J/q7w5j1P0OfdDvd2EvUGK4Ye5J3cuQwnAVvu+DZ/19vTDfj2Jw0OitzeqnFekBMMImdziH+J1QbHAD2OkwDCFfDS3gTWaRXf5JLV7yrUJOS37YyjuHa+cJpSQLt6mMNzNaHxeEYTYZMUl1v4j2Qc2zZyhN47Vv49dXyDovJApgJqo/d8nfpCZhCILDsdvGyUzWYWQUsb/SqdtX3RKYyhym7hc23x76YbFWj3Pw4VY+NgU3q03+J2oHia1U92O8WsgZ03EMWuAQ2EkrGGLr56HGJnh7wYzb0Xv81/mL0/LsONyfkmCDu6mP7lDP+K460SFPd1yF6RaWilJFsjDRrS9B9FbJxBUy81ouF4EkHRRzf2ZlcxHRUbMR9nSLtJquC+XY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38350700014)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kr2pk1FqptI6gqQIoildVuj4xIGftNdoiPopsIBoh5He4cSTOcFYN+CPGenq?=
 =?us-ascii?Q?Q9xpKGM9g8aaxWcES79IGrEWobIOQDiZmTLef4tGeIgFxxGEF+gyBcvnlTxu?=
 =?us-ascii?Q?V9680kSusacenADYDxoM2Np4g94gj0JUHNS0ctFSGmapTIaAMefqjr0zOaRf?=
 =?us-ascii?Q?Pb/hKUNqPLqKMRZvPV7Q3lQRQWGTKFRL0OW5MUw4EfNElEGDqkP2uRKrv6O0?=
 =?us-ascii?Q?DXT5VgucP0Ph02u4iwhlwSfECvNQUteZrEeN75M6Moy0ItdyNBgMi3IFxeoq?=
 =?us-ascii?Q?Gp/GxkghZtTAc8bqdQA+6FOvqjFOqQPPv1lM+iyDCartHsIPY7ZnwwLUdXM2?=
 =?us-ascii?Q?iuWjzRs8IMg26WZgw0lD2fe/zIkuJwr9Zghb7LGJ14Nv7CEryEOkUQ8kwP3m?=
 =?us-ascii?Q?P8n2yQjqvF+6Xl661kbdPvX/l2ihxGaERtXsjR6AdxCRX24mn3t7439iqUqu?=
 =?us-ascii?Q?7mswSHWzeMqa4LfMi5wsL/8mzPDfL2pu3cRuqlNDv5nD5+X2avydGQFV5oaW?=
 =?us-ascii?Q?HEtDLayKL1DPDN5d1wm+k552Oz69Txh2qvp69MedPY+AIOYWrnplyT0crBPR?=
 =?us-ascii?Q?ppjAdAIeYwI2cZddOR7yEny1eZE7bvVVxpQvJaVb58xv5rs9h5VIS3fxCaEO?=
 =?us-ascii?Q?6QztFATuyfhTOsDvl+w6QScAJ9HbiRbml6QEu1bu6JPGYwIjBOW0D19Fhuwe?=
 =?us-ascii?Q?HBv1gx6VUgLZWo4TGz6bsYMjEVW+8PaiEaS3ZpIipfTRnMqwYSDiaAjREm36?=
 =?us-ascii?Q?2ncB6i1Kaf+0slPG43jjr0aN3gft+yNRrfoXPJF3G7X2ZaqHEuGrYeirHChb?=
 =?us-ascii?Q?qKt4J+rXFS9cnsGo5B7u+qSChF6SFxojhxaj5IeCg552dNRDrlHebNK7x70B?=
 =?us-ascii?Q?jpsJNUgLM3vpH9efbWK3XgMos1A3DVoCl8BwvFRSyxrAqsb5gAyMTno7iiMI?=
 =?us-ascii?Q?Z8/iWBF9i/bppOleuuvZ0+69McZ9Vr0XGd43KsBkN3V/vQ8O+GJFV6HEh+yk?=
 =?us-ascii?Q?WlBxlt/4Mde0p4XirFwI6v//zsHYIQeXj4a0H+i6gcByKr5eHesBfltpzruZ?=
 =?us-ascii?Q?VokNRarExSOzhCkfIxc0pyoF+O5VBFsVXVIwr3hOqiocq21sbtKZiQXYywtl?=
 =?us-ascii?Q?OMi+2PPhBenv+2t1Rxpvp7lITWu0K/OLaF89k9l6OlUwA3yd+7J/r31cg59B?=
 =?us-ascii?Q?X73/K6q8+zx7ZNlY/MoNRCKCCM4XubBSk0ek8gFYeZDeRMbxyjZyjBcaBJfc?=
 =?us-ascii?Q?m+i50PtVe0U1p0OM/8x/k2wLg2ThlIpzQmmpADKmSKjsJ8+byVVsr6OYa+re?=
 =?us-ascii?Q?6idAUi7/Urigo14HPd4k8VkUkXjdhkmopXcNnvRi6R1X2HMSk1S4N2IIyHjU?=
 =?us-ascii?Q?10nWL+7hfN4Xy+ZWv4vfVBra2Pf7JioSf+vheo3iCPnRKm5OPzoTkVgnIEFO?=
 =?us-ascii?Q?OXK13nMXeC4KQsribDHkFcEG27PQMks9TvH/NraQmOxIamAzieA7q75WS9nP?=
 =?us-ascii?Q?6ZnhJUBujN9QWqra6MmUJvqxTGwG8Rr+vuza0dfVYAHcgnCyg8uR7ONBm+au?=
 =?us-ascii?Q?0zn6xZqK8v9T7YBM8Cum7wtacoXuRxFKzkRYSlzUj3FBS1IuYBg9malpbHqI?=
 =?us-ascii?Q?jJKt4dEICluqKX+HfbxPsryVLyxZF9Nk0chiOZ9KyAyDqaC5jpTbk1oozB+B?=
 =?us-ascii?Q?XW0hFT8Oq7kfKumSGrOVPibkt6JkwXZGe755XxQFBDrDxrEyoiT2oQ6mOtlT?=
 =?us-ascii?Q?uBb/2s9kvbBb3WcjSfCsbZaTZ2eCEIeAHH+3dYetw5+tn3EjmQE4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46600f70-a0ab-4dd7-c60f-08def9e27b1e
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:00:25.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVxRh52nYFD84zQsYzCEXoql8qIwizTNFokWfJZBLpXDkV+5pnmd4NU13jjm2tYJcjZTIWJ66O/kK3FnsSdr2Wn7fpv2xkYbiSC1Qqx0/xp3E3PIij7pnwE47HBsliNp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12615

Hi Peter,

On Thu, Aug 13, 2026 at 12:38:06PM +0200, Peter Rosin wrote:
> On 2026-08-10 09:51, Tommaso Merciai wrote:
> > Dear All,
> > 
> > This patch adds a new mux driver for RZ/V2H USB VBENCTL VBUS_SEL.
> > 
> > All patches in the original series ([0]) have been merged except this one,
> > so this is just a follow-up patch to add the mux driver.
> > 
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com/
> > 
> > Thanks & Regards,
> > Tommaso
> Thanks for your patience, I have added the patch to the mux for-next
> branch [1] and it should show up in linux-next when next is regenerated
> (usually within a day or two).
> 
> However, it is now too late for the patch to actually hit the 7.3
> merge window. I will feed it to Greg in time for the 7.4 merge window
> instead.

Thanks for sharing.

Kind regards,
Tommaso

> 
> Cheers,
> Peter
> 
> [1] https://gitlab.com/peda-linux/mux
> 
