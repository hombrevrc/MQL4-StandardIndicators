//+------------------------------------------------------------------+
//|                                                MovingAverage.mqh |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+


#ifndef _LOAD_MODULE_MA
#define _LOAD_MODULE_MA


#include <mql4_modules\StandardIndicators\IndicatorsBase.mqh>


/** Moving Average */
class MA : public IndicatorsBase
{
   public:
      int period;
      int ma_shift;
      int ma_method;
      int applied_price;
      
      MA(void);
      double Value(const int shift);
};


MA::MA(void)
{
   this.symbol        = _Symbol;
   this.timeframe     = 0;
   this.period        = 20;
   this.ma_shift      = 0;
   this.ma_method     = MODE_SMA;
   this.applied_price = PRICE_CLOSE;
}


double MA::Value(const int shift)
{
   return(iMA(this.symbol,
              this.timeframe,
              this.period,
              this.ma_shift,
              this.ma_method,
              this.applied_price,
              shift)
          );
}


#endif
