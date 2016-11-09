Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 9 Nov 2016 12:24:28 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yangbo Lu <yangbo.lu@nxp.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] ARM: shmobile: Document DT bindings for CCCR and
 PRR
Message-ID: <20161109182428.lgwo4rqfxelibl3h@rob-hp-laptop>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
 <1477913455-5314-6-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477913455-5314-6-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 31, 2016 at 12:30:53PM +0100, Geert Uytterhoeven wrote:
> Add device tree binding documentation for the Common Chip Code Register
> and Product Register, which provide SoC product and revision
> information.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
