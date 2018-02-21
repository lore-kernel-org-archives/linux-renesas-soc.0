Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750741AbeBUXKr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Feb 2018 18:10:47 -0500
MIME-Version: 1.0
In-Reply-To: <20180220231046.32638-7-laurent.pinchart+renesas@ideasonboard.com>
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com> <20180220231046.32638-7-laurent.pinchart+renesas@ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Feb 2018 17:10:25 -0600
Message-ID: <CAL_Jsq+D4wwPSZbSXrJpwcNvB1Xth=Cn-bTyXL2RkSOb9s+d_A@mail.gmail.com>
Subject: Re: [PATCH v4 06/16] of: unittest: changeset helpers
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Matt Porter <mporter@konsulko.com>,
        Koen Kooi <koen@dominion.thruhere.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Vasut <marex@denx.de>, Wolfram Sang <wsa@the-dreams.de>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 5:10 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>
> Add a unitest specific for the new changeset helpers.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/of/unittest.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 7a9abaae874d..1b21d2c549a8 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -609,6 +609,59 @@ static void __init of_unittest_changeset(void)
>  #endif
>  }
>
> +static void __init of_unittest_changeset_helper(void)
> +{
> +#ifdef CONFIG_OF_DYNAMIC

I think this can be:

if (!IS_ENABLED(CONFIG_OF_DYNAMIC))
  return;

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
