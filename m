Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AEFCD37B0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Sep 2023 18:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjIRSXO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Sep 2023 14:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjIRSXN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 14:23:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55816126;
        Mon, 18 Sep 2023 11:23:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6319EC433C9;
        Mon, 18 Sep 2023 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695061385;
        bh=K6Jke6f1gOGRYXeQmbl6ZNz2+SRAqJPVYZt+5kqTTuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QCofasMjtggYwXhb+cdAOlpMq73wdnDBhaK2BjV1PXve7JJnbun1K7Yd8CfgBcJes
         APO/WThH3dJEURfJTdhL4LhTR5qfzhDyl7qR4r4T+GhlpAbmF7gUcff4dBXVUtgxlC
         WCtNvN/ryoRGoQ0hWllcRTEaUx0FKXieC9N+GN1L0YugaKAxPjINaSlcfImXyEsE/N
         rmblrUxjhhgTbcIgnNxMtotA+z0ypE8D/mRh+O1H1yQbwiR02DVk461kA6n4I1H3AS
         PygbfKTKnxJgBefLnHW0JhLLC2Nv63ULzQ4RRuUqu9JjZAagYdZjAFjic2ord/kIew
         SfErX9sRBlzMQ==
Received: (nullmailer pid 1473334 invoked by uid 1000);
        Mon, 18 Sep 2023 18:22:58 -0000
Date:   Mon, 18 Sep 2023 13:22:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        George McCollister <george.mccollister@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
        Marcin Wojtas <mw@semihalf.com>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Marek Vasut <marex@denx.de>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Crispin <john@phrozen.org>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Felix Fietkau <nbd@nbd.name>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 04/10] dt-bindings: net: dsa: nxp,sja1105:
 improve MDIO bus bindings
Message-ID: <20230918182258.GA1464506-robh@kernel.org>
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <20230916110902.234273-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230916110902.234273-5-arinc.unal@arinc9.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Sep 16, 2023 at 02:08:56PM +0300, Arınç ÜNAL wrote:
> The SJA1110 switch uses the mdios property for its two MDIO buses. Instead
> of a pattern, define two mdio nodes. This ensures the same compatible
> string won't be used twice. The address and size cell definitions can also
> be removed now that the reg property has become unnecessary.
> 
> Move the comment to the description of mdios, mdio0, and mdio1 properties.
> Disallow the mdios property for SJA1105. Require at least one of the MDIO
> buses to be defined to prevent empty mdios child node.

It's an ABI. You can't just change this.

You can split the pattern into 'mdio@0' and 'mdio@1' with different 
compatibles for each if you want.

Rob
