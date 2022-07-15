Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A521C43334
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Jul 2022 11:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiGOL5l (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Jul 2022 07:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiGOL5k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jul 2022 07:57:40 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F908AB12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jul 2022 04:57:39 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id BB8EF22175;
        Fri, 15 Jul 2022 13:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1657886257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IeF/ZV4745DLDYtdFsqkpNDCQqS8SqtwibNm/bx4IMc=;
        b=tj2/p2eGw1/PBhQrI8h2f+d/MYaa72wZnnR9dHJx6Z9v1kXp7GZ5Ljzht3RxhO1OSjDtxX
        tUtLFZjsu8Ge9/bDlhhIzAFECyRXaXMkPq3TCdx63jZ+MKFhtIYYGfQnUDJwBj8PHrs6k3
        Uxt11XEgG8NE6XrlX3t8K3B7HrztQbw=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Jul 2022 13:57:37 +0200
From:   Michael Walle <michael@walle.cc>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add support for SNOR_ID3 macro
In-Reply-To: <20220715105716.2415068-2-biju.das.jz@bp.renesas.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-2-biju.das.jz@bp.renesas.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <90beaa944df3778a50278afd2ac4bb8f@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am 2022-07-15 12:57, schrieb Biju Das:
> Add SNOR_ID3 macro to get chip info by parsing sfdp.

This is the same as [1]. I'd expect that patch 2/2 will go
in as soon as [1] is merged.

-michael

[1] 
https://lore.kernel.org/linux-mtd/20220510140232.3519184-2-michael@walle.cc/
