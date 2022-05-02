Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F2CC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  2 May 2022 11:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384728AbiEBLdN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 2 May 2022 07:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384723AbiEBLdM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 07:33:12 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC73913D7E
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 04:29:43 -0700 (PDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 470E2221D4;
        Mon,  2 May 2022 13:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1651490982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X8yhrYbcbZ6HGnNY9n6KEKX4eSeghVm/di1XSPlgOWU=;
        b=SmJGLQCgJllCHPoxw/H1RRNsmDFU6CpPrNY2P68tFOJLsR3qRw3GzFqDS2ynZaCLfuR/9J
        06DobBX2c/ktYf+BJ91mt4Gl8zMomf51Crg8tvdasIurlUcg35qp6jCLYVFn2M8SJZatt1
        vkAUEDBmGmgaNiuTThc9qmXXmlgdFCc=
From:   Michael Walle <michael@walle.cc>
To:     biju.das.jz@bp.renesas.com
Cc:     Chris.Paterson2@renesas.com, biju.das@bp.renesas.com,
        geert+renesas@glider.be, linux-mtd@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, michael@walle.cc,
        miquel.raynal@bootlin.com, p.yadav@ti.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richard@nod.at,
        tudor.ambarus@microchip.com, vigneshr@ti.com
Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Date:   Mon,  2 May 2022 13:29:34 +0200
Message-Id: <20220502112934.2433516-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

>  drivers/mtd/spi-nor/Makefile  |  1 +
>  drivers/mtd/spi-nor/core.c    |  1 +
>  drivers/mtd/spi-nor/core.h    |  1 +
>  drivers/mtd/spi-nor/renesas.c | 57 +++++++++++++++++++++++++++++++++++

Please put the flash in atmel.c. There are all the Atmel/Adesto/now Renesas
flashes.

> +static const struct flash_info renesas_nor_parts[] = {
> +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +};

I suppose this flash supports SFDP. Therefore,
	{ "at25ql128a", PARSE_SFDP },
should be enough.

I see that the 0x1f42xx IDs are also used for the at25sl series.
Could you shed some light to what the differences are? Are they
compatible, do we have to distiguish between them?

Last, for a new flash submission we require a SFDP dump. See [1].

[1] https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

> +static void renesas_nor_default_init(struct spi_nor *nor)
> +{
> +	nor->flags |= SNOR_F_HAS_LOCK;

Did you test locking?

-michael
