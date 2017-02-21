Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58902 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751826AbdBULO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2017 06:14:29 -0500
Subject: Re: [PATCH/RFC 3/6] drivers: firmware: psci: Implement shallow
 suspend mode
To: Pavel Machek <pavel@ucw.cz>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <1487622809-25127-1-git-send-email-geert+renesas@glider.be>
 <1487622809-25127-4-git-send-email-geert+renesas@glider.be>
 <20170221110712.GB5021@amd>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <lina.iyer@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <de2a15d4-9ac2-9ba9-a47a-eacbf478f601@arm.com>
Date: Tue, 21 Feb 2017 11:14:16 +0000
MIME-Version: 1.0
In-Reply-To: <20170221110712.GB5021@amd>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 21/02/17 11:07, Pavel Machek wrote:
> Hi!
> 
>> Enable support for "shallow" suspend mode, also known as "Standby" or
>> "Power-On Suspend".
>>
>> As secondary CPU cores are taken offline, "shallow" suspend mode saves
>> slightly more power than "s2idle", but less than "deep" suspend mode.
>> However, unlike "deep" suspend mode, "shallow" suspend mode can be used
>> regardless of the presence of support for PSCI_SYSTEM_SUSPEND, which is
>> an optional API in PSCI v1.0.
> 
> If system supports "shallow" suspend, why does not PSCI implement it?
> 

Yes it can, and IIUC it already does on this platform with CPU_SUSPEND.
All it now needs is just to use existing "freeze" suspend mode in Linux.

> In the past, I was told PSCI will not turn into ACPI-like mess, and
> that we'll be able to fix PSCI and will not have to work around its
> problems in kernel :-(.

Can you be more elaborate on the mess you see on this Renesas platform.

For me, it looks like this patch is attempting to *re-implement* the
existing "suspend-to-idle" functionality. So IMO, this patch set is
creating unnecessary mess giving an illusion that PSCI specification is
broken.

-- 
Regards,
Sudeep
