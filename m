Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:39905 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932773AbeAKREu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 12:04:50 -0500
Date: Thu, 11 Jan 2018 18:04:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
        David Miller <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
Message-ID: <20180111170441.GC3735@lunn.ch>
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
 <20180111.104835.381039264896352436.davem@davemloft.net>
 <20180111155316.GV17719@n2100.armlinux.org.uk>
 <CAMuHMdVH4TJM=eZcEe7d-G_ykQPjAMajOgtvSOPKRtUTP1CjRA@mail.gmail.com>
 <CAMuHMdVyU5EWM5W3rO2o5uQkEdCWLH+xaAJCEN=0iYLj6xy+vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVyU5EWM5W3rO2o5uQkEdCWLH+xaAJCEN=0iYLj6xy+vg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Sorry, the phy_restore_page() semantics are driving me crazy.
> Let's revert.

I will try to take a look today.

  Andrew
