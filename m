Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3866023.VvEQmjTL1d@avalon>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180215000415.19077-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAL_JsqJMwHQoht0Jj_UCVWgrW=1dU5egWrTeSVfFrKGfqMm9+g@mail.gmail.com> <3866023.VvEQmjTL1d@avalon>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Feb 2018 08:04:54 -0600
Message-ID: <CAL_JsqK8r31pQ1j_VQ_fR=vnNm3=x_pTiz7G_KEpjO3jwy9izA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 3:15 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Rob,
>
> On Tuesday, 20 February 2018 02:54:00 EET Rob Herring wrote:
>> On Wed, Feb 14, 2018 at 6:04 PM, Laurent Pinchart wrote:
>> > The internal LVDS encoders now have their own DT bindings. Before
>> > switching the driver infrastructure to those new bindings, implement
>> > backward-compatibility through live DT patching.
>> >
>> > Patching is disabled and will be enabled along with support for the new
>> > DT bindings in the DU driver.
>> >
>> > Signed-off-by: Laurent Pinchart
>> > <laurent.pinchart+renesas@ideasonboard.com>

>> > +static int __init rcar_du_of_add_property(struct device_node *np,
>> > +                                         const char *name, const void
>> > *value,
>> > +                                         size_t length)
>>
>> So, were you going to revive Pantelis' patch or move this to the core?
>
> Do you have a pointer to that patch ?

https://patchwork.kernel.org/patch/9104571/
https://patchwork.kernel.org/patch/9104591/
https://patchwork.kernel.org/patch/9104611/
https://patchwork.kernel.org/patch/9104581/
https://patchwork.kernel.org/patch/9104601/
