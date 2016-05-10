Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 10 May 2016 10:37:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] cpufreq: rcar: Add support for R8A7795 SoC
Message-ID: <20160510050710.GC2790@vireshk-i7>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
 <5731664D.1030909@rvc.renesas.com>
 <573169CD.8050607@rvc.renesas.com>
 <57316A4E.7040100@rvc.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57316A4E.7040100@rvc.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10-05-16, 11:57, Khiem Nguyen wrote:
> After the commit "a399dc9fc50 cpufreq: shmobile: Use generic platdev
> driver", will use cpufreq-dt-platdev driver to enable cpufreq-dt support.
> Hence, follow the implementation to support new R8A7795 SoC.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
