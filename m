Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 20 Aug 2016 22:27:53 -0700 (PDT)
Message-Id: <20160820.222753.1870314112887146628.davem@davemloft.net>
To: tremyfr@gmail.com
Cc: sergei.shtylyov@cogentembedded.com,
        kazuya.mizuguchi.ks@renesas.com, ykaneko0929@gmail.com,
        horms+renesas@verge.net.au, masaru.nagai.vx@renesas.com,
        geert+renesas@glider.be, niklas.soderlund+renesas@ragnatech.se,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] net: ethernet: renesas: ravb: use new api
 ethtool_{get|set}_link_ksettings
From: David Miller <davem@davemloft.net>
In-Reply-To: <1471647139-1867-2-git-send-email-tremyfr@gmail.com>
References: <1471647139-1867-1-git-send-email-tremyfr@gmail.com>
        <1471647139-1867-2-git-send-email-tremyfr@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Philippe Reynes <tremyfr@gmail.com>
Date: Sat, 20 Aug 2016 00:52:19 +0200

> The ethtool api {get|set}_settings is deprecated.
> We move this driver to new api {get|set}_link_ksettings.
> 
> Signed-off-by: Philippe Reynes <tremyfr@gmail.com>

Applied.
