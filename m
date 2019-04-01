Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28221C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 14:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0100920857
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 14:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfDAOYd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 10:24:33 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:44052 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726657AbfDAOYd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 10:24:33 -0400
Received: (qmail 1765 invoked by uid 2102); 1 Apr 2019 10:24:32 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Apr 2019 10:24:32 -0400
Date:   Mon, 1 Apr 2019 10:24:32 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Biju Das <biju.das@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jianguo Sun <sunjianguo1@huawei.com>,
        Avi Fishman <AviFishman70@gmail.com>,
        Ofer Heifetz <oferh@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
In-Reply-To: <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
Message-ID: <Pine.LNX.4.44L0.1904011023240.1506-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 1 Apr 2019, Biju Das wrote:

> This patch adds the glue code required to ensure the on-chip EHCI
> controller works on RZ/G1C(a.k.a R8A77470) SoC's from Renesas.

You should explain what this new glue code does.  And why is it needed? 
Can't you use the existing ehci-platform driver instead?

Alan Stern

