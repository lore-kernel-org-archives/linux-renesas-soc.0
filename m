Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180516.142102.1650229402143291732.davem@davemloft.net>
References: <20180515235619.27773-1-f.fainelli@gmail.com> <20180516.142102.1650229402143291732.davem@davemloft.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 May 2018 20:32:58 +0200
Message-ID: <CAMuHMdUBk3xT1G0XLd3Y8AJxrCb5zbegNu07dwMsX3zGjvgUpA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] of: mdio: Fall back to mdiobus_register()
 with NULL device_node
To: David Miller <davem@davemloft.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
        netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Fugang Duan <fugang.duan@nxp.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>,
        Tobias Jordan <Tobias.Jordan@elektrobit.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Maxim Uvarov <muvarov@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)"
        <linux-omap@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi David,

On Wed, May 16, 2018 at 8:21 PM, David Miller <davem@davemloft.net> wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> Date: Tue, 15 May 2018 16:56:17 -0700
>
>> This patch series updates of_mdiobus_register() such that when the device_node
>> argument is NULL, it calls mdiobus_register() directly. This is consistent with
>> the behavior of of_mdiobus_register() when CONFIG_OF=n.
>>
>> I only converted the most obvious drivers, there are others that have a much
>> less obvious behavior and specifically attempt to deal with CONFIG_ACPI.
>>
>> Changes in v2:
>>
>> - fixed build error in davincin_mdio.c (Grygorii)
>> - reworked first patch a bit: commit message, subject and removed useless
>>   code comment
>
> Based upon Andrew's response to Geert's feedback, I'm applying this series.

Thanks, his feedback made perfect sense.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
