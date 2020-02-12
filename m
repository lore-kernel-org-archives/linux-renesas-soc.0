Return-Path: <SRS0=mZgV=4A=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7613C3B186
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Feb 2020 17:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 842342168B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Feb 2020 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581527366;
	bh=WxQ7PbbXyIoC7+GJrQ+uRoXEdtshYOhNhga+Q5j5StU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=tOYNtLWMjf1dfMKLwEOKYtZGohNj8oyl/SCeFANsEWMzy1jESURQIBN5Qk+GyqSOQ
	 xgBwZx3PD9boVOSvTRM6r/uE4nMyVaS/5MdBFcVcMhz/J34RxfqChXlPY92rK+ylAc
	 huV5bPlz41dR0aXsqRKbdVIEqBbLXTN35wz6lCS4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgBLRJ0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Feb 2020 12:09:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:57976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727548AbgBLRJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 12:09:26 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72ACD206D7;
        Wed, 12 Feb 2020 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581527365;
        bh=WxQ7PbbXyIoC7+GJrQ+uRoXEdtshYOhNhga+Q5j5StU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XpRX7ne2mZkalX9khWt5mbVKEE+pTXnEivDwPc1ytzZaF8Ikxuz/DzSybwhXFMZ7z
         vAugyREUU5xdwNYxGsMH2zCGj/BqqHmyrKKxCgkWRv/f/YEDTPG6xb1HzXWTeq0w3w
         cxb0L7ikrzIL7lKvc3yacFK9POK3dyz4MqgbnpcQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200212100830.446-5-geert+renesas@glider.be>
References: <20200212100830.446-1-geert+renesas@glider.be> <20200212100830.446-5-geert+renesas@glider.be>
Subject: Re: [PATCH 4/7] ARM: rockchip: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chen-Yu Tsai <wens@csie.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Russell King <linux@armlinux.org.uk>
Date:   Wed, 12 Feb 2020 09:09:24 -0800
Message-ID: <158152736474.121156.2573812734157351119@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-12 02:08:27)
> The Rockchip platform code is not a clock provider, and just needs to
> call of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
