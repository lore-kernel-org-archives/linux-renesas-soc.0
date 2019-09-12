Return-Path: <SRS0=6nl3=XH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7194C47404
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Sep 2019 12:17:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C326A20856
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Sep 2019 12:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731542AbfILMRx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 12 Sep 2019 08:17:53 -0400
Received: from verein.lst.de ([213.95.11.211]:46732 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731283AbfILMRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 08:17:53 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 78A73227A81; Thu, 12 Sep 2019 14:17:49 +0200 (CEST)
Date:   Thu, 12 Sep 2019 14:17:49 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     hch@lst.de, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, treding@nvidia.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mmc: queue: Fix bigger segments usage
Message-ID: <20190912121749.GA18421@lst.de>
References: <1568261636-25625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568261636-25625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Thanks,

applied to the dma-mapping tree for 5.4.
