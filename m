Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44508 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731137AbeGQMZ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 08:25:26 -0400
Received: by mail-lj1-f196.google.com with SMTP id q127-v6so723788ljq.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 04:53:08 -0700 (PDT)
Date: Tue, 17 Jul 2018 13:53:06 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] regulator: bd9571mwv: Document "backup_mode"
 sysfs file
Message-ID: <20180717115306.GH10087@bigcity.dyn.berto.se>
References: <20180716153052.1830-1-geert+renesas@glider.be>
 <20180716153052.1830-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180716153052.1830-4-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your work.

On 2018-07-16 17:30:52 +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Pavel Machek <pavel@ucw.cz>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v4:
>   - Add Acked-by,
> 
> v3:
>   - New.
> ---
>  .../testing/sysfs-driver-bd9571mwv-regulator  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-bd9571mwv-regulator
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-bd9571mwv-regulator b/Documentation/ABI/testing/sysfs-driver-bd9571mwv-regulator
> new file mode 100644
> index 0000000000000000..4d63a7904b94a993
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-bd9571mwv-regulator
> @@ -0,0 +1,27 @@
> +What:		/sys/bus/i2c/devices/.../bd9571mwv-regulator.*.auto/backup_mode
> +Date:		Jul 2018
> +KernelVersion:	4.19
> +Contact:	Geert Uytterhoeven <geert+renesas@glider.be>
> +Description:	Read/write the current state of DDR Backup Mode, which controls
> +		if DDR power rails will be kept powered during system suspend.
> +		("on"/"1" = enabled, "off"/"0" = disabled).
> +		Two types of power switches (or control signals) can be used:
> +		  A. With a momentary power switch (or pulse signal), DDR
> +		     Backup Mode is enabled by default when available, as the
> +		     PMIC will be configured only during system suspend.
> +		  B. With a toggle power switch (or level signal), the
> +		     following steps must be followed exactly:
> +		       1. Configure PMIC for backup mode, to change the role of
> +			  the accessory power switch from a power switch to a
> +			  wake-up switch,
> +		       2. Switch accessory power switch off, to prepare for
> +			  system suspend, which is a manual step not controlled
> +			  by software,
> +		       3. Suspend system,
> +		       4. Switch accessory power switch on, to resume the
> +			  system.
> +		     DDR Backup Mode must be explicitly enabled by the user,
> +		     to invoke step 1.
> +		See also Documentation/devicetree/bindings/mfd/bd9571mwv.txt.
> +Users:		User space applications for embedded boards equipped with a
> +		BD9571MWV PMIC.
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
