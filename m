Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34597 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750726AbeFAXbI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jun 2018 19:31:08 -0400
Subject: Re: [PATCH v4 6/6] PCI: rcar: Shut the PHY down in failpath
To: Simon Horman <horms@verge.net.au>
Cc: linux-pci@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-renesas-soc@vger.kernel.org,
        Bjorn Helgaas <helgaas@kernel.org>
References: <20180524143624.26718-1-marek.vasut+renesas@gmail.com>
 <20180524143624.26718-7-marek.vasut+renesas@gmail.com>
 <20180528084813.ic5gyos7hq5vxknw@verge.net.au>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0a7b03be-b2f8-0965-ac5c-5bb3988a6da0@gmail.com>
Date: Sat, 2 Jun 2018 01:30:00 +0200
MIME-Version: 1.0
In-Reply-To: <20180528084813.ic5gyos7hq5vxknw@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/28/2018 10:48 AM, Simon Horman wrote:
> On Thu, May 24, 2018 at 04:36:24PM +0200, Marek Vasut wrote:
>> If anything fails past phy_init_fn() and the system is a Gen3 with
>> a PHY, the PHY will be left on and inited. This is caused by the
>> phy_init_fn, which is in fact a pointer to rcar_pcie_phy_init_gen3()
>> function, which starts the PHY, yet has no counterpart in the failpath.
>> Add that counterpart.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Cc: Phil Edworthy <phil.edworthy@renesas.com>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa@the-dreams.de>
>> Cc: linux-renesas-soc@vger.kernel.org
>> Fixes: 517ca93a7159 ("PCI: rcar: Add R-Car gen3 PHY support")
> 
> Acked-by: Simon Horman <horms+renesas@verge.net.au>

While I see the first 5 in today's next, I don't see this one there, so
it'd be nice to add it too.

-- 
Best regards,
Marek Vasut
