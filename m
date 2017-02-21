Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 21 Feb 2017 17:20:13 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Pavel Machek <pavel@ucw.cz>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Lina Iyer <lina.iyer@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH/RFC 3/6] drivers: firmware: psci: Implement shallow
 suspend mode
Message-ID: <20170221172012.GD8605@leverpostej>
References: <1487622809-25127-1-git-send-email-geert+renesas@glider.be>
 <1487622809-25127-4-git-send-email-geert+renesas@glider.be>
 <20170221110712.GB5021@amd>
 <de2a15d4-9ac2-9ba9-a47a-eacbf478f601@arm.com>
 <CAMuHMdVmu4AYZ6MZHd79N2-2gELR6s3oZ46UnEszCfLvHymY1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVmu4AYZ6MZHd79N2-2gELR6s3oZ46UnEszCfLvHymY1w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On Tue, Feb 21, 2017 at 05:32:50PM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 21, 2017 at 12:14 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > On 21/02/17 11:07, Pavel Machek wrote:
> >>> Enable support for "shallow" suspend mode, also known as "Standby" or
> >>> "Power-On Suspend".
> >>>
> >>> As secondary CPU cores are taken offline, "shallow" suspend mode saves
> >>> slightly more power than "s2idle", but less than "deep" suspend mode.
> >>> However, unlike "deep" suspend mode, "shallow" suspend mode can be used
> >>> regardless of the presence of support for PSCI_SYSTEM_SUSPEND, which is
> >>> an optional API in PSCI v1.0.
> >>
> >> If system supports "shallow" suspend, why does not PSCI implement it?
> >
> > Yes it can, and IIUC it already does on this platform with CPU_SUSPEND.
> > All it now needs is just to use existing "freeze" suspend mode in Linux.
> 
> How can Linux know if using "deep" suspend will allow to wake-up the system
> according to configured wake-up sources, or not?

My understanding is that if a device can wake the system from
PSCI_SYSTEM_SUSPEND, it should be described in the DT as a wakeup source
[1]. So we should be able to determine the set of devices which can wake
the system from a suspend. We shouldn't assume that other devices can
(though I don't precisely what we do currently).

Otherwise, where PSCI_CPU_SUSPEND, we'd expect that most devices
(barring cpu-local timers) can wake up CPUs, and hence the system, by
raising an interrupt.

Thanks,
Mark.

[1] Documentation/devicetree/bindings/power/wakeup-source.txt
