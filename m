Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC68C433DB
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Feb 2021 15:30:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89E564E83
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Feb 2021 15:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhBXP1K (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Feb 2021 10:27:10 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:55836 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236851AbhBXNqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Feb 2021 08:46:31 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1lEuTw-008ESx-Lj; Wed, 24 Feb 2021 14:45:36 +0100
Date:   Wed, 24 Feb 2021 14:45:36 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Adam Ford <aford173@gmail.com>
Cc:     netdev@vger.kernel.org, aford@beaconembedded.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/5] ARM: dts: renesas: Add fck to etheravb-rcar-gen2
 clock-names list
Message-ID: <YDZYgEm+wBFFJgXW@lunn.ch>
References: <20210224115146.9131-1-aford173@gmail.com>
 <20210224115146.9131-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224115146.9131-2-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 24, 2021 at 05:51:42AM -0600, Adam Ford wrote:
> The bindings have been updated to support two clocks, but the
> original clock now requires the name fck.  Add a clock-names
> list in the device tree with fck in it.

Hi Adam

I think requires is too strong. As far as i can see, you don't
introduce a change using the name 'fck'. So the name is optional,
which is good, because otherwise you would break backwards
compatibility with DT blobs.

Is the plan to merge this whole patchset via netdev? If so, you need
to repost anyway, once netdev reopens. So maybe you can change the
wording?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
