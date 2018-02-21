Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750741AbeBUX3K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Feb 2018 18:29:10 -0500
MIME-Version: 1.0
In-Reply-To: <20180220231046.32638-9-laurent.pinchart+renesas@ideasonboard.com>
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com> <20180220231046.32638-9-laurent.pinchart+renesas@ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Feb 2018 17:28:48 -0600
Message-ID: <CAL_JsqKBSeNU2jDX-pLsGAUJtzBVk9=-Hg0Etq_0JTd_8RccVQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/16] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 5:10 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The internal LVDS encoders now have their own DT bindings. Before
> switching the driver infrastructure to those new bindings, implement
> backward-compatibility through live DT patching.
>
> Patching is disabled and will be enabled along with support for the new
> DT bindings in the DU driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> new file mode 100644
> index 000000000000..6ebb355b652a
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_du_of_lvds_r8a7790.dts - Legacy LVDS DT bindings conversion for R8A7790
> + *
> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + *
> + * Based on work from Jyri Sarha <jsarha@ti.com>
> + * Copyright (C) 2015 Texas Instruments
> + */
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>

Doesn't seem to be used in any of these.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +       fragment@0 {
> +               target-path = "/";
> +               __overlay__ {
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +
> +                       lvds@feb90000 {
> +                               compatible = "renesas,r8a7790-lvds";
> +                               reg = <0 0xfeb90000 0 0x1c>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               lvds0_input: endpoint {
> +                                               };
> +                                       };
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               lvds0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       lvds@feb94000 {
> +                               compatible = "renesas,r8a7790-lvds";
> +                               reg = <0 0xfeb94000 0 0x1c>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               lvds1_input: endpoint {
> +                                               };
> +                                       };
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               lvds1_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       fragment@1 {
> +               target-path = "/display@feb00000/ports";
> +               __overlay__ {
> +                       port@1 {
> +                               endpoint {
> +                                       remote-endpoint = <&lvds0_input>;
> +                               };
> +                       };
> +                       port@2 {
> +                               endpoint {
> +                                       remote-endpoint = <&lvds1_input>;
> +                               };
> +                       };
> +               };
> +       };
> +};
