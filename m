Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35087 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752274AbeCNP5z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Mar 2018 11:57:55 -0400
Received: by mail-lf0-f66.google.com with SMTP id t132-v6so5598339lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Mar 2018 08:57:54 -0700 (PDT)
Subject: Re: [PATCH/RFC 1/2] PM / wakeup: Add callback for wake-up change
 notification
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1521026785-26456-1-git-send-email-geert+renesas@glider.be>
 <1521026785-26456-2-git-send-email-geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b2fbba62-72c9-f21a-5aa1-f96291fddb3e@cogentembedded.com>
Date: Wed, 14 Mar 2018 18:57:51 +0300
MIME-Version: 1.0
In-Reply-To: <1521026785-26456-2-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/14/2018 02:26 PM, Geert Uytterhoeven wrote:

> Add a callback to inform a device that his wake-up setting has been

   s/his/its/.

> changed.  This allows a device to synchronize device configuration with
> an external user action.
> 
> E.g. on systems using a Rohm BD9571MWV PMIC and a toggle accessory power
> switch, the system suspend procedure is:
>   1. Configure PMIC for DDR backup mode, which changes the role of the
>      accessory power switch from a power to a wake-up switch,
>   2. Switch accessory power switch off, to prepare for system suspend,
>   3. Suspend system.
> 
> Hence step 1 cannot be done in the PMIC's suspend callback, but it can
> be done in the new callback, in response to the user writing "enabled"
> to the PMIC's wakeup virtual file in sysfs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

MBR, Sergei
