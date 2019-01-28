Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A202C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F69E2148E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfA1SE2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:04:28 -0500
Received: from pbmsgap02.intersil.com ([192.157.179.202]:53584 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfA1SE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 13:04:28 -0500
X-Greylist: delayed 346 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Jan 2019 13:04:27 EST
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x0SHrNfh028453;
        Mon, 28 Jan 2019 12:58:40 -0500
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2q8jkg9h99-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 28 Jan 2019 12:58:39 -0500
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Mon, 28 Jan 2019 12:58:38 -0500
Received: from ubuntu.localdomain (132.158.202.108) by pbmxdp03.intersil.corp
 (132.158.200.224) with Microsoft SMTP Server id 15.1.1531.3 via Frontend
 Transport; Mon, 28 Jan 2019 12:58:38 -0500
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-serial@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH] serial: sh-sci: Do not free irqs that have already been freed
Date:   Mon, 28 Jan 2019 12:58:32 -0500
Message-ID: <20190128175832.33670-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-01-28_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=8 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1901280134
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since IRQs might are muxed on some parts, we need to pay attention when we
are freeing them.
Otherwise we get the ugly WARNING "Trying to free already-free IRQ 20".

Fixes: 628c534ae735 ("serial: sh-sci: Improve support for separate TEI and DRI interrupts")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/tty/serial/sh-sci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index cb3d5d37674f..060fcd42b6d5 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1936,7 +1936,7 @@ static int sci_request_irq(struct sci_port *port)
 
 static void sci_free_irq(struct sci_port *port)
 {
-	int i;
+	int i, j;
 
 	/*
 	 * Intentionally in reverse order so we iterate over the muxed
@@ -1952,6 +1952,13 @@ static void sci_free_irq(struct sci_port *port)
 		if (unlikely(irq < 0))
 			continue;
 
+		/* Check if already freed (irq was muxed) */
+		for (j = 0; j < i; j++)
+			if (port->irqs[j] == irq)
+				j = i + 1;
+		if (j > i)
+			continue;
+
 		free_irq(port->irqs[i], port);
 		kfree(port->irqstr[i]);
 
-- 
2.16.1

