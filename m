Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:42818 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729002AbeKAA3W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 20:29:22 -0400
Subject: Re: [PATCH v2 2/2] irqchip: Add support for Renesas RZ/N1 GPIO
 interrupt multiplexer
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20181030104438.27827-1-phil.edworthy@renesas.com>
 <20181030104438.27827-3-phil.edworthy@renesas.com>
 <86d0rq35o1.wl-marc.zyngier@arm.com>
 <TY1PR01MB176959B0CF663D0ECB298924F5CD0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Message-ID: <b95c7fc3-7fda-48b7-6933-b7b183b6fa67@arm.com>
Date: Wed, 31 Oct 2018 15:30:50 +0000
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB176959B0CF663D0ECB298924F5CD0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Phil,

On 31/10/18 15:09, Phil Edworthy wrote:
> Hi Marc,
> 
> Many thanks for a quick response!
> 
> On 31 October 2018 08:02, Marc Zyngier wote:
>> On Tue, 30 Oct 2018 10:44:38 +0000, Phil Edworthy wrote:
>>>
>>> On RZ/N1 devices, there are 3 Synopsys DesignWare GPIO blocks each
>>> configured to have 32 interrupt outputs, so we have a total of 96 GPIO
>>> interrupts. All of these are passed to the GPIO IRQ Muxer, which
>>> selects
>>> 8 of the GPIO interrupts to pass onto the GIC. The interrupt signals
>>> aren't latched, so there is nothing to do in this driver when an
>>> interrupt is received, other than tell the corresponding GPIO block.
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>> ---
>>> v2:
>>>  - Use interrupt-map to allow the GPIO controller info to be specified
>>>    as part of the irq.
>>>  - Renamed struct and funcs from 'girq' to a more comprehenisble 'irqmux'.
>>> ---
>>>  drivers/irqchip/Kconfig        |  10 ++
>>>  drivers/irqchip/Makefile       |   1 +
>>>  drivers/irqchip/rzn1-irq-mux.c | 235
>>> +++++++++++++++++++++++++++++++++
>>>  3 files changed, 246 insertions(+)
>>>  create mode 100644 drivers/irqchip/rzn1-irq-mux.c
>>>
>>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig index
>>> 96451b581452..3a60a8af60dd 100644
>>> --- a/drivers/irqchip/Kconfig
>>> +++ b/drivers/irqchip/Kconfig
>>> @@ -204,6 +204,16 @@ config RENESAS_IRQC
>>>  	select GENERIC_IRQ_CHIP
>>>  	select IRQ_DOMAIN
>>>
>>> +config RENESAS_RZN1_IRQ_MUX
>>> +	bool "Renesas RZ/N1 GPIO IRQ multiplexer support"
>>> +	depends on ARCH_RZN1
>>> +	select IRQ_DOMAIN
>>> +	select IRQ_DOMAIN_HIERARCHY
>>> +	help
>>> +	  Say yes here to add support for the GPIO IRQ multiplexer
>> embedded
>>> +	  in Renesas RZ/N1 SoC devices. The GPIO IRQ Muxer selects which of
>>> +	  the interrupts coming from the GPIO controllers are used.
>>> +
>>>  config ST_IRQCHIP
>>>  	bool
>>>  	select REGMAP
>>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile index
>>> b822199445ff..b090f84dd42e 100644
>>> --- a/drivers/irqchip/Makefile
>>> +++ b/drivers/irqchip/Makefile
>>> @@ -45,6 +45,7 @@ obj-$(CONFIG_SIRF_IRQ)			+=
>> irq-sirfsoc.o
>>>  obj-$(CONFIG_JCORE_AIC)			+= irq-jcore-aic.o
>>>  obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
>>>  obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
>>> +obj-$(CONFIG_RENESAS_RZN1_IRQ_MUX)	+= rzn1-irq-mux.o
>>>  obj-$(CONFIG_VERSATILE_FPGA_IRQ)	+= irq-versatile-fpga.o
>>>  obj-$(CONFIG_ARCH_NSPIRE)		+= irq-zevio.o
>>>  obj-$(CONFIG_ARCH_VT8500)		+= irq-vt8500.o
>>> diff --git a/drivers/irqchip/rzn1-irq-mux.c
>>> b/drivers/irqchip/rzn1-irq-mux.c new file mode 100644 index
>>> 000000000000..767ce67e34d2
>>> --- /dev/null
>>> +++ b/drivers/irqchip/rzn1-irq-mux.c
>>> @@ -0,0 +1,235 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * RZ/N1 GPIO Interrupt Multiplexer
>>> + *
>>> + * Copyright (C) 2018 Renesas Electronics Europe Limited
>>> + *
>>> + * On RZ/N1 devices, there are 3 Synopsys DesignWare GPIO blocks each
>>> +configured
>>> + * to have 32 interrupt outputs, so we have a total of 96 GPIO interrupts.
>>> + * All of these are passed to the GPIO IRQ Muxer, which selects 8 of
>>> +the GPIO
>>> + * interrupts to pass onto the GIC.
>>> + */
>>> +
>>> +#include <linux/bitops.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/irq.h>
>>> +#include <linux/irqchip/chained_irq.h> #include <linux/irqdomain.h>
>>> +#include <linux/kernel.h> #include <linux/module.h> #include
>>> +<linux/of_irq.h> #include <linux/of_platform.h>
>>> +
>>> +#define GPIO_IRQ_SPEC_SIZE	3
>>> +#define MAX_NR_GPIO_CONTROLLERS	3
>>> +#define MAX_NR_GPIO_IRQ		32
>>> +#define MAX_NR_INPUT_IRQS	(MAX_NR_GPIO_CONTROLLERS *
>> MAX_NR_GPIO_IRQ)
>>> +#define MAX_NR_OUTPUT_IRQS	8
>>> +
>>> +struct irqmux_priv;
>>> +struct irqmux_one {
>>> +	unsigned int mapped_irq;
>>> +	unsigned int input_irq_nr;
>>> +	struct irqmux_priv *priv;
>>> +};
>>> +
>>> +struct irqmux_priv {
>>> +	struct device *dev;
>>> +	struct irq_chip irq_chip;
>>
>> Do we really need this to be per-device? See below.
> I thought we generally wanted everything to be per-device so that we can
> cope when someone sticks two of these in a device. Am I wrong?

This only contains function pointers that are specific to a particular
type of interrupt controller. Nothing in struct irq_chip is
instance-specific.

> 
>>
>>> +	struct irq_domain *irq_domain;
>>> +	unsigned int nr_irqs;
>>> +	struct irqmux_one irq[MAX_NR_OUTPUT_IRQS]; };
>>> +
>>> +static void irqmux_handler(struct irq_desc *desc) {
>>> +	struct irq_chip *chip = irq_desc_get_chip(desc);
>>> +	struct irqmux_one *girq = irq_desc_get_handler_data(desc);
>>> +	struct irqmux_priv *priv = girq->priv;
>>> +	unsigned int irq;
>>> +
>>> +	chained_irq_enter(chip, desc);
>>> +
>>> +	irq = irq_find_mapping(priv->irq_domain, girq->input_irq_nr);
>>> +	generic_handle_irq(irq);
>>
>> No error handling? See below again, as I think this outline a fundamental flaw
>> in the driver.
>>
>>> +
>>> +	chained_irq_exit(chip, desc);
>>> +}
>>> +
>>> +static int irqmux_domain_map(struct irq_domain *h, unsigned int irq,
>>> +			     irq_hw_number_t hwirq)
>>> +{
>>> +	struct irqmux_priv *priv = h->host_data;
>>> +
>>> +	irq_set_chip_data(irq, h->host_data);
>>> +	irq_set_chip_and_handler(irq, &priv->irq_chip, handle_simple_irq);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct irq_domain_ops irqmux_domain_ops = {
>>> +	.map	= irqmux_domain_map,
>>> +};
>>> +
>>> +static int irqmux_probe(struct platform_device *pdev) {
>>> +	struct device *dev = &pdev->dev;
>>> +	struct device_node *np = dev->of_node;
>>> +	struct resource *res;
>>> +	u32 __iomem *regs;
>>> +	struct irqmux_priv *priv;
>>> +	u32 int_specs[MAX_NR_OUTPUT_IRQS][GPIO_IRQ_SPEC_SIZE];
>>> +	DECLARE_BITMAP(irqs_in_used, MAX_NR_INPUT_IRQS);
>>> +	unsigned int irqs_out_used = 0;
>>> +	unsigned int i;
>>> +	int nr_irqs;
>>> +	int ret;
>>> +
>>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->dev = dev;
>>> +	platform_set_drvdata(pdev, priv);
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	regs = devm_ioremap_resource(dev, res);
>>> +	if (IS_ERR(regs))
>>> +		return PTR_ERR(regs);
>>> +
>>> +	nr_irqs = of_irq_count(np);
>>> +	if (nr_irqs < 0)
>>> +		return nr_irqs;
>>> +
>>> +	if (nr_irqs > MAX_NR_OUTPUT_IRQS) {
>>> +		dev_err(dev, "too many output interrupts\n");
>>> +		return -ENOENT;
>>> +	}
>>> +
>>> +	priv->nr_irqs = nr_irqs;
>>> +
>>> +	/* Get the interrupt specifers */
>>> +	if (of_property_read_u32_array(dev->of_node, "interrupts",
>>> +				       (u32 *)int_specs,
>>> +				       priv->nr_irqs * GPIO_IRQ_SPEC_SIZE)) {
>>> +		dev_err(dev, "cannot get interrupt specifiers\n");
>>> +		return -ENOENT;
>>> +	}
>>> +
>>> +	bitmap_zero(irqs_in_used, MAX_NR_INPUT_IRQS);
>>> +
>>> +	/* Check the interrupt specifiers */
>>> +	for (i = 0; i < priv->nr_irqs; i++) {
>>> +		u32 *int_spec = int_specs[i];
>>> +		u32 input_irq = int_spec[1] * MAX_NR_GPIO_IRQ +
>> int_spec[2];
>>> +
>>> +		dev_info(dev, "irq %u=gpio%ua:%u\n", int_spec[0],
>> int_spec[1],
>>> +			 int_spec[2]);
>>> +
>>> +		if (int_spec[0] >= MAX_NR_OUTPUT_IRQS ||
>>> +		    int_spec[1] >= MAX_NR_GPIO_CONTROLLERS ||
>>> +		    int_spec[2] >= MAX_NR_GPIO_IRQ) {
>>> +			dev_err(dev, "invalid interrupt args\n");
>>> +			return -ENOENT;
>>> +		}
>>> +
>>> +		if (irqs_out_used & BIT(int_spec[0]) ||
>>> +		    test_bit(input_irq, irqs_in_used)) {
>>> +			dev_err(dev, "irq %d already used\n", i);
>>> +			return -ENOENT;
>>> +		}
>>
>> I don't think the driver should be in the business of DT validation, and that
>> you should simply drop this code.
> When I implement Rob H's feedback on the binding, this should no longer be
> needed.
> 
>>
>>> +
>>> +		irqs_out_used |= BIT(int_spec[0]);
>>> +		set_bit(input_irq, irqs_in_used);
>>> +	}
>>> +
>>> +	/* Create IRQ domain for the interrupts coming from the GPIO blocks
>> */
>>> +	priv->irq_chip.name = dev_name(dev);
>>
>> OK, that's where I think we have a problem. Your irqchip structure seem to
>> only be used to display a name?!?
> Right, that wasn't the intention! So, how do I hook in my own interrupt handler
> without calling irq_set_chip_and_handler()?
> That's what led me to think I need an irq_chip instance.

That's the thing, you don't need it. each irq_chip is just a bunch of
methods, and these methods apply to all the instances of the same
controller.

>> To start with, that's not really the primary use for this object, and I'd like it to
>> be a single static structure for the whole driver. Userspace doesn't need to
>> know about the name, so please get rid of this.
>>
>> The real issue is that you build the whole thing as a chained interrupt
>> controller, meaning that nothing controls the masking of the interrupt. If, as I
>> understand it, this IP is an interrupt router that selects 8 out of 32 interrupts
>> and passes them onto the GIC, then a noisy device can just take the whole
>> CPU down by keeping the line asserted, and SW cannot mask it.
> The interrupts into this mux come from GPIO blocks that do the masking. The
> GPIO blocks in this case are standard Synopsys IP blocks.
> There is nothing in the irq mux hardware that can mask them, or do anything
> other than select which one to use, hence why this is a chained interrupt
> controller. Should I be using something else in this case?

There are two cases:
1) there is 1:1 mapping between a used input and an output, leaving some
input unused
2) there is an n:1 mapping between input and output, and all the input
can be used at any given time

If what you have is (1), you need to implement an hierarchy.
If what you have is (2), you need to implement a chained controller.

(1) requires you to revisit this driver, making it a lot more like ti's
irq-crossbar
(2) requires you to actually do some decoding in the chained handler

I believe you're in configuration (1). Am I right?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
