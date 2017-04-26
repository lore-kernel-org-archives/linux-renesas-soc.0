Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 26 Apr 2017 09:43:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [RESEND][PATCH V2 4/4] regulator: Add ROHM BD9571MWV-M PMIC
 regulator driver
Message-ID: <20170426084325.ti2ntm4d6kt36jjn@dell>
References: <20170425183210.30594-1-marek.vasut+renesas@gmail.com>
 <20170425183210.30594-4-marek.vasut+renesas@gmail.com>
 <20170425223106.zriauibqrboxaj4b@sirena.org.uk>
 <e694bd6d-0b7f-c30a-9db0-12d8a8cc2648@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e694bd6d-0b7f-c30a-9db0-12d8a8cc2648@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 26 Apr 2017, Marek Vasut wrote:
> On 04/26/2017 12:31 AM, Mark Brown wrote:
> > On Tue, Apr 25, 2017 at 08:32:10PM +0200, Marek Vasut wrote:
> >> Add driver for the regulator block in the ROHM BD9571MWV-W MFD PMIC.
> >> This block supports three voltage monitors, VD18, VD25, VD33 for the
> >> 1V8, 2V5, 3V3 voltage rails and a single voltage regulator for the
> >> DVFS rail.
> > 
> > Please do not submit new versions of already applied patches, please
> > submit incremental updates to the existing code.  Modifying existing
> > commits creates problems for other users building on top of those
> > commits so it's best practice to only change pubished git commits if
> > absolutely essential.
> 
> I resubmitted this on Lee's request [1].

I think you misunderstood.

Judging by what I've seen, I *assume* you want me to apply some
patches which would not normally come under my jurisdiction.  In order
for this to happen, you need to send those patches directly to me
(hyperlinks to some random representation of them somewhere on the
internets will not do), complete with Acks from their associated
Maintainer(s).  This is why I asked you for a [RESEND].  I made no
mention of resending patches which have already been applied into an
upstream tree.  There is seldom ever good reason to do this.

Moving forward I need you to do the following:

1. Remove any patches from the set which have already been applied
2. Apply all Acks you have collected to the patches
3. Resend only the ones you wish applied, not forgetting to Cc me

> [1]
> https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg13599.html

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
