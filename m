Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:57260 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932295AbdJVBhn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Oct 2017 21:37:43 -0400
Date: Sun, 22 Oct 2017 02:37:38 +0100 (WEST)
Message-Id: <20171022.023738.2186250991838185660.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org,
        frowand.list@gmail.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of_mdio: Fix broken PHY IRQ in case of probe
 deferral
From: David Miller <davem@davemloft.net>
In-Reply-To: <1508327643-3579-1-git-send-email-geert+renesas@glider.be>
References: <1508327643-3579-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Second ping, this patch needs a review ASAP.

Geert's hard-resetting PHY changes depend upon this change.

Thank you.
