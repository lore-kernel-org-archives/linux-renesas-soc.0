Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:57202 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751560AbdHITGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 15:06:02 -0400
Date: Wed, 9 Aug 2017 12:05:57 -0700
From: Tony Lindgren <tony@atomide.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, krzk@kernel.org,
        jason@lakedaemon.net, arm@kernel.org, andrew@lunn.ch,
        gregory.clement@free-electrons.com,
        sebastian.hesselbarth@gmail.com, baohua@kernel.org,
        horms@verge.net.au, magnus.damm@gmail.com, vireshk@kernel.org,
        shiraz.linux.kernel@gmail.com, patrice.chotard@st.com,
        nico@linaro.org, dave.martin@arm.com, marc.zyngier@arm.com
Subject: Re: [PATCH 12/15] arm-soc: omap: replace open coded VA->PA
 calculations
Message-ID: <20170809190556.GD3934@atomide.com>
References: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
 <20170805205222.19868-13-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170805205222.19868-13-ard.biesheuvel@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Ard Biesheuvel <ard.biesheuvel@linaro.org> [170805 13:54]:
> This replaces a couple of open coded calculations to obtain the
> physical address of a far symbol with calls to the new adr_l etc
> macros.

I gave this series a quick test and omap3 no longer boots it seems.

Regards,

Tony
