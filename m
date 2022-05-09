Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7683FC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 May 2022 15:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238437AbiEIPiZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 9 May 2022 11:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238435AbiEIPiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 11:38:24 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82264231C9B;
        Mon,  9 May 2022 08:34:30 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id BC631FF804;
        Mon,  9 May 2022 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652110469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5KLuJlfNEA5Fbzc0NZoL/MBREpZ4szczQ+9JCfaD3NQ=;
        b=PL0vubCc5JiqT/rNnrn6CLfeOz8ceMyyGjJByHomeB+MrDwcanoPmdG4jr2hvLzAdshhrw
        Hh+zBfc/KwdW02sYBG+yGBs9US0CJLUaD2iCp/xyyZTDD3hwaU44OKB2dY8tgRvxRUNH6z
        4SOCmxt/URhi5TR2ix8H4gxKMSmcFBUq6G0ViYZ+9ZO7bfPjIus3b1NZhiaJkVE/+FPSOg
        NFDlaTPcgbTyGhMaKRAAeXa3VMHyoBn63lQYiDuYW+bmpLDfIl1o61PHrmBcspF7Uby8lF
        UI5nEEerrxJzH7eR1VHHfYCTh5jn3UFFr9YWUANcjAfiktQB2iHWfrTBiu5f2Q==
Date:   Mon, 9 May 2022 17:34:24 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
Message-ID: <20220509173424.75ec0d1a@xps13>
In-Reply-To: <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
        <20220429105229.368728-4-miquel.raynal@bootlin.com>
        <CAMuHMdVnx3O15aQw4Oxw-hfPZFUidMGQ_5HfQun9m_fKkAnm3w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,


> >         ret =3D dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> >         if (ret)
> > -               goto disable_eclk;
> > +               return ret;
> > +
> > +       pm_runtime_enable(&pdev->dev);
> > +       pm_runtime_get_sync(&pdev->dev); =20
>=20
> ret =3D pm_runtime_resume_and_get)...);
> if (ret < 0) ...

I also changed the enable call to use devm_pm_runtime_enable() and
dropped the calls to pm_runtime_disable() below (same in the RTC
driver).

>=20
> > +
> > +       /* The external NAND bus clock rate is needed for computing tim=
ings */
> > +       eclk =3D clk_get(&pdev->dev, "eclk");
> > +       if (IS_ERR(eclk)) {
> > +               ret =3D PTR_ERR(eclk);
> > +               goto dis_runtime_pm;
> > +       }
> > +
> > +       rnandc->ext_clk_rate =3D clk_get_rate(eclk);
> > +       clk_put(eclk);
> >

Thanks,
Miqu=C3=A8l
