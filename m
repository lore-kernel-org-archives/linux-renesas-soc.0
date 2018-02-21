Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180220231046.32638-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com> <20180220231046.32638-5-laurent.pinchart+renesas@ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Feb 2018 17:14:51 -0600
Message-ID: <CAL_JsqKHc=PtLTeihg0wk5o3YxHvLAGA44xCp5jpSXm=Wcit3A@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] of: changesets: Introduce changeset helper methods
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
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 5:10 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>
> Changesets are very powerful, but the lack of a helper API
> makes using them cumbersome. Introduce a simple copy based
> API that makes things considerably easier.
>
> To wit, adding a property using the raw API.
>
>         struct property *prop;
>         prop = kzalloc(sizeof(*prop)), GFP_KERNEL);
>         prop->name = kstrdup("compatible");
>         prop->value = kstrdup("foo,bar");
>         prop->length = strlen(prop->value) + 1;
>         of_changeset_add_property(ocs, np, prop);
>
> while using the helper API
>
>         of_changeset_add_property_string(ocs, np, "compatible",
>                         "foo,bar");
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> [Fixed memory leak in __of_changeset_add_update_property_copy()]
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/of/dynamic.c | 222 ++++++++++++++++++++++++++++++++++
>  include/linux/of.h   | 328 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 550 insertions(+)

Other than what Geert pointed out,

Reviewed-by: Rob Herring <robh@kernel.org>
