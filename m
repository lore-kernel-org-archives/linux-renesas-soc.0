Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 22 Apr 2016 12:17:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linaro-kernel <linaro-kernel@lists.linaro.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	linux-renesas-soc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/8] cpufreq: shmobile: Use generic platdev driver
Message-ID: <20160422064733.GA13716@vireshk-i7>
References: <cover.1461228081.git.viresh.kumar@linaro.org>
 <ab29df38f70453e67089e3f3dbb9085336eef1c2.1461228081.git.viresh.kumar@linaro.org>
 <CAMuHMdUnzgr==S86Wiz0fGk2gSWW2=j+maiq3=3x9Ozy7AoOZw@mail.gmail.com>
 <20160422032142.GN29799@vireshk-i7>
 <CAMuHMdWXH+Oud+ZZbYFUcTN1a0v9_BJbP5cMLxx0tRWHzx4ADQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWXH+Oud+ZZbYFUcTN1a0v9_BJbP5cMLxx0tRWHzx4ADQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 22-04-16, 08:41, Geert Uytterhoeven wrote:
> I was mainly thinking about kernel size.

Ahh, I see..

> If this is done once per boot, the array should be __initconst,
> (looking at the code
> in next) which is fine as cpufreq_dt_platdev_init() is already __init.

Sure, makes sense.. I will do that as a separate patch.

Though just to correct what I earlier said, if cpufreq-dt is developed as a
module, its done once per module insertion :)

-- 
viresh
