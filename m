Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [RESEND][PATCH V2 4/4] regulator: Add ROHM BD9571MWV-M PMIC
 regulator driver
To: Mark Brown <broonie@kernel.org>
References: <20170425183210.30594-1-marek.vasut+renesas@gmail.com>
 <20170425183210.30594-4-marek.vasut+renesas@gmail.com>
 <20170425223106.zriauibqrboxaj4b@sirena.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, lee.jones@linaro.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e694bd6d-0b7f-c30a-9db0-12d8a8cc2648@gmail.com>
Date: Wed, 26 Apr 2017 01:49:20 +0200
MIME-Version: 1.0
In-Reply-To: <20170425223106.zriauibqrboxaj4b@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/26/2017 12:31 AM, Mark Brown wrote:
> On Tue, Apr 25, 2017 at 08:32:10PM +0200, Marek Vasut wrote:
>> Add driver for the regulator block in the ROHM BD9571MWV-W MFD PMIC.
>> This block supports three voltage monitors, VD18, VD25, VD33 for the
>> 1V8, 2V5, 3V3 voltage rails and a single voltage regulator for the
>> DVFS rail.
> 
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

I resubmitted this on Lee's request [1].

[1]
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg13599.html

-- 
Best regards,
Marek Vasut
