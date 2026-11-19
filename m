Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109692;
	b=gsPht2SFDTAizg7Cd+BzUDvkRZQ5zQ+j2AoWc0C+0SPM2+Vv004tZYXi1kEw06u1BSM8
	 AzkAXkLWvt0h/rZQD5YBV/HvoIaMrylFGSiWmT2TCXWpEgiJm7deOUwtjyIDLvIT2qUw4
	 zjxmwGkbKMFOj9L8IZ/lrIBifptNOz6XA4fo1aPpejVDN+5FHd8gHubHEIA0fkxmYd5TF
	 d7SW1/VDcDuZxtoGgX3d/TIIHUvEvV211L7D4qAmucJp06GqXBiT6QpmSXy8DgZpmRlyy
	 KboQ4tmLI1H2KCOcDj1PJ1j+YsMEoAjUKFFj7ZSxFLGxT5doYcWKq9JzfTLr6CHU8Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109692;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
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
	bh=ayBWGTI0V9uQB/AzmmRVUIAjBgFiA8eXvOBYbYerdXM=;
	b=hqjlXlS3QV91mItJL9pPHnPnmKg5sIcwsl6qPV9tlh61uxzmOuqX/XRoWvm5SlkGL/W5
	 EIXAWBnCOF/9T+2qlu33JAedMr37RKmEMBp5OxF5A90EfRDxP5+lCT1eN6LdkgFyFuo+C
	 ZYKVozB0m8Cs/pSHLAfRKRN3CH6eU0nZPRdRKnhUcbzMPQcumIBZk6uHnbHB/E8+7j0jB
	 5n0dKRPj+YjLwbJt028jzTRiNG7TVhjtvz9TkhsP+4Gf0JKXEB213vt3B/CyrBfjA9af/
	 cKWhR6qCld/yn69iPtvlYvcjTWyVENYlHaOzUShKVOpiWg8SZ12gE7qm4XbWptarPgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MUD6K8P0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B9606A33C;
	Thu, 19 Nov 2026 17:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836B9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MUD6K8P0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfg8NaI3aRJ2FuOUD6BFAGFGbLLKIqNSoNCxGwC1g4AiVIaBak/0LYk2QTF13xtcoj4iI2U3Bb5mNODyeJpOryWZ5A9S2AtMBMYhKgHpQJjYOY7iK5hv8/EBf7aK8bAska8h1xpJMCHq5yGjz9K2JtYYty2QdQEI5zE90Q48SU6KrurQp1VekH/HdJod8Llpr3d/B7w+yy3t5SKmtAi4KXGy0MOXHmsTSVm3dlr/L0V2a+C6oh7XQhwVnFZT99dNeE0ZMzRIkJD/Fa3RlyIOOOBcv7rWWgjJMWBJ+ipVNMIzM56NzxGAwRcDo4LX+WXpfNjvzFc+ZMrPZhLBO9Fy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayBWGTI0V9uQB/AzmmRVUIAjBgFiA8eXvOBYbYerdXM=;
 b=VvBpsfx7Mshp0ni8pAkI82ylfKnJs0dM2HcxyJm3cjVhRJQvp6GhekjpwyB3WP2iprv7EqtWAk5ReaWCBa9bM+4kbmaBHig3PhOUFq9gGDOPR0hIt36TWkM/wMP0srto6z87qmMhmU8ka1B1hZzzGnoSeKWZov5crJhzE+u19DRKclmgNsc8G8z90chs3Y6+7h79wfHK1phRkbeahMwbBdmYAOzyfp1gkAjDrh6JYslJXPqEw4N7Ok9/N/JZvHdniDhjZJXRC2Fxp7HnUE5L+YMvwy9ioIGm/DvR1AnRXlGt6Q8U3eLCqT8JblQpGPOr73xTpqiaV18Off53K3kQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayBWGTI0V9uQB/AzmmRVUIAjBgFiA8eXvOBYbYerdXM=;
 b=MUD6K8P0sC1HkBinHQuXMFLxtnjMFH8KezKTNpR3aNByAJsX5taEJBjzfcZ+n+DUnR0gqISzDPWO9ha3Qs7gVU2U82CaL5QNeiQYQOcXC9BgJ5hMUZZfOTnwGhA87AzJTJy0J85syCL2apL0zlV1wWwWHIhadh/lpRPV1wLQnr0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:34:47 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:34:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: jacopo.mondi@ideasonboard.com,
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 02/10] media: rzg2l-cru: Add device_link from CRU to CSI-2
Date: Thu, 19 Nov 2026 18:34:05 +0100
Message-ID: <20261119173413.341658-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119173413.341658-1-tommaso.merciai.xr@bp.renesas.com>
References: <20261119173413.341658-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To OSOPR01MB295138.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|OS3PR01MB10422:EE_
X-MS-Office365-Filtering-Correlation-Id: 7224b211-8824-4d3d-4d08-08df4663682e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tYfXfX2MW4LiUnaUDhcUkNzlVRmEMp4ANT8/4Ahe572wz51ZM5J+z+g0YpKY8JrXQlVzhDOoBoaXEX9CHAU66NVmVw2ny+rPOPFlPlUwQkHKDcayaEPs3zq5P778QZhwEFK+QiZBBkjSEDHrOl7ll2pq6SpCxgk5s/NLcb57EMxmslUhkbP7G5uCZKWqdWrlBMAW6wVKOpBBpxRChq28WBaNDixx9QH7QP1KGMmUY/5iDiKO9NywL2Mpcqb/E4f9hHLV4O07UXhWwWM+6hbtHdliqzAhEKVrA85f81u1U/cX/sy3Iha22ua9tpuFVfg+xMEm7Z/L+Pnz5mWQ9TYq2dqv5WLuEV9DpH8050Ef8sx5FqRE6jvstQjVENfAwepXAXUDQfr+992dFk5kLtmm/1sXTLLnVnOlghaFxO4CXqTUSIGGbT5Vkc42hCAKuCcjDIKxTrB68PG91caw8fwXGXvghCodE+l6irQpGy4fGg2PLJ1eW5m5eoGbohf9wDSa5SSaR8GRIiQ186M0UyqjU8P6dWHx6z/+SXW502yRooXPwQlfu6WKD103ctanvgYjUUVPMGeZZXNZ7T1BLFryt16k0YzKu/9W01vGLdqKNGG6tv1tJ6s6R6e2eEIgeSXCrLgZNS5f/02lYQegsCIqsESr6uXf3xvhk4wZbdwlrSbQZeVDybLp4H315IiTR8MTaeZgWZRfU21xAkX3LasvHij9umEGT5Bb14xfO5Q5mL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O6GO7bXyc9nR6xa771wVAkGV+X9sDo9WyPltqm9SL3t7BUuTvacMwcVLSkRj?=
 =?us-ascii?Q?Yo9pfSjINUryNMwYjzI/AJUlqtSsbfG3BlJXZfWpuaM7wiUzSPk5WswERwtp?=
 =?us-ascii?Q?N/m7YNyGoEKyuFbXUMD4ID1vSEyeiDSMJmamWwe0nREpIoRUc7NKyecoBB3I?=
 =?us-ascii?Q?baIoPNd3ZlQJyv6znrANt8HZqJ9JTLN8PyxDTskzKVJd6ZsYPMbRw1H9eaCJ?=
 =?us-ascii?Q?+b4rZj0of1Fp42es+G1HpYk9A1dthOZpgB87GQ8/7bq74S6VEr6jeyuSI29t?=
 =?us-ascii?Q?lNwcis93J/jT6Rl0/tgOY+KoUooQWdlQW67x4OCG7F+t5NqiNPIArM0Lwcye?=
 =?us-ascii?Q?SiZ9/ft64Dx8ESdvjYmq5dQdecLyBRsDei2ahabAEt6AZYkW15MeIQktMCkt?=
 =?us-ascii?Q?ARJTIpYhbpEwMS489xWVtyrLJCak6xWYhutxoC2b9VdeyObQmp5Y6pmGuL5r?=
 =?us-ascii?Q?44Ugp6Td6lHVgVzi6rRiTyt6Dc8Id4yBIHnodDQrcx+fek/ZWBO0/nnx/XYA?=
 =?us-ascii?Q?32CbMmjOS7E3RN1wdGwfLL996RK4bWJCwJAiiV54INwrGxhAjGB4Jbl6ki8G?=
 =?us-ascii?Q?b3aC3lJgVFKo24faLJFFZlUOLK8OShDzfJpdJIOiA3LniP3A0Na9M5tm4hgn?=
 =?us-ascii?Q?BJ/wcS0Ba5bhPHgxj/tSwh9R1Q9r/hRM0HARU2thtQjBlG80mn35Z+GCMSei?=
 =?us-ascii?Q?t61oNZOsVBvGDVxif7RKnLaY8B3faURWbvtSukLifGNa+I0ETAAXA/k19uE2?=
 =?us-ascii?Q?KpwfCVR3KG8XNbF3IXUBVxkE7CAgvGQKOp2P51mqfaIoo9b4bDpvFS5w9/lU?=
 =?us-ascii?Q?ZTO2tW5ndLJSNPXVZcWmjn1dPdTOQS+8nVfB+r+7Jh3QfFKSBJgVj11bkHy9?=
 =?us-ascii?Q?xVR5MwT/hdBv77LhCqv9eNZPnw0KIw0hP3cf9hp2MwMHTILvAK6tdYgBtBPv?=
 =?us-ascii?Q?VR8IGTtoWC1qWPA6QZRk4WmfXN7FmRRZbpO4aG0NcG4oaN/b5llRy/Hbgdal?=
 =?us-ascii?Q?OUZfoehQxtOl2fe+tqX9K8IdUT9j7FL8AGo8kzJcWy9ITw6nY6cQrIw3h2ow?=
 =?us-ascii?Q?Fppqysg3FBgELbL9YoBl92Uk+0TSthpaS9Cpp5Ws2Qe2TK66cJRRPhp2bXou?=
 =?us-ascii?Q?KtKzsBR7i0umIeAc2RxXNXrhPn1a7vjVHCehrp/FdKi3o0i0LMMABjkAaEGn?=
 =?us-ascii?Q?ziTOoZhR3J0IaJLqskEsQECzHIxu3PlYNx7RNrPZLU70oL/LcS+YPrMreHhq?=
 =?us-ascii?Q?hL+wYZj0yYHoF9LR0j+4WB91cGviP0TsXM+tKbZO8OelrvEMdC1msYkX3PfZ?=
 =?us-ascii?Q?3pBwys/6RT6CaoIueEvAtnQy6JhsvLTJMyJOofv4yWxdMeErtcrss9/7Fl92?=
 =?us-ascii?Q?6FQZLR0VGRZxW6VCYa5rMBkcQHbU/8NAefSPx0uY3Ym0tbX996HWZBNx9/XU?=
 =?us-ascii?Q?kWi+ILcRT6mvqIK+Oxs8nZNTboxIz496eECg9EmkW2+soVvkIWTKNlZdhNs0?=
 =?us-ascii?Q?zwn5cEGecvvQ84djqws5UpGyafMTkdseayQKfYvcbf/PU0p6puUDqZvBC2mj?=
 =?us-ascii?Q?0oXnqmA8iaCPTkucNg/cuLuDfJ3K1VFl3jzblwFpbB5nE2N33jogZvI6HWFF?=
 =?us-ascii?Q?ZcXfRAZ5jf6z7wGZ+vZZgq/3ZoRlurDsphhaicHopUE3A/Nw5FVn0hx/6SOg?=
 =?us-ascii?Q?9OxUJKklZJSxVZ8E9Fa3HKg4sZNTCA24zcqUpelax2oZKZUbkrm4qQXsWzJ5?=
 =?us-ascii?Q?MlC+PtT+ndRMO1FZcJprpgLDmNzXzxaQi5b1evIJ7v+/YNcfxs/5?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7224b211-8824-4d3d-4d08-08df4663682e
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:34:47.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NjJO5T985lic8xEg0vpq75lNENUxEUPy3DQ4KV2odpOq+qd8oYPqXMqESDsaH9qh1EoEZdDDYy1ODXw2O25jWGtG0B4ye1Ba0B8p5DL1lXLs7kBKmvRoje0eTpLw+if
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

The CRU device depends on CSI-2 to operate. Without an explicit
device_link the PM core has no knowledge of this dependency and may
suspend CSI-2 while CRU is still active, or resume CRU before CSI-2
is ready.

Add a DL_FLAG_STATELESS device_link from the CRU to CSI-2 when the
CSI-2 subdev binds. This instructs the PM core to suspend CRU before
CSI-2 and to resume CSI-2 before CRU. The link is deleted on unbind.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Dropped mdev_lock usage, now removed by the previous patch.
 - Set cru->csi.subdev only after the device link has been created.

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 0609f381091b..3bfdf0818936 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -98,6 +98,7 @@ static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	rzg2l_cru_ip_subdev_unregister(cru);
 
 	if (cru->csi.asd == asd) {
+		device_link_remove(cru->dev, subdev->dev);
 		cru->csi.subdev = NULL;
 		dev_dbg(cru->dev, "Unbind CSI-2 %s\n", subdev->name);
 	}
@@ -110,6 +111,11 @@ static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
 	struct rzg2l_cru_dev *cru = notifier_to_cru(notifier);
 
 	if (cru->csi.asd == asd) {
+		if (!device_link_add(cru->dev, subdev->dev, DL_FLAG_STATELESS)) {
+			dev_err(cru->dev, "Failed to create device link to CSI-2 %s\n",
+				subdev->name);
+			return -EINVAL;
+		}
 		cru->csi.subdev = subdev;
 		dev_dbg(cru->dev, "Bound CSI-2 %s\n", subdev->name);
 	}
-- 
2.54.0

