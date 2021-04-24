{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Lightsail.GetLoadBalancerMetricData
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns information about health metrics for your Lightsail load balancer.
--
--
-- Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
module Network.AWS.Lightsail.GetLoadBalancerMetricData
  ( -- * Creating a Request
    getLoadBalancerMetricData,
    GetLoadBalancerMetricData,

    -- * Request Lenses
    glbmdLoadBalancerName,
    glbmdMetricName,
    glbmdPeriod,
    glbmdStartTime,
    glbmdEndTime,
    glbmdUnit,
    glbmdStatistics,

    -- * Destructuring the Response
    getLoadBalancerMetricDataResponse,
    GetLoadBalancerMetricDataResponse,

    -- * Response Lenses
    glbmdrrsMetricName,
    glbmdrrsMetricData,
    glbmdrrsResponseStatus,
  )
where

import Network.AWS.Lens
import Network.AWS.Lightsail.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'getLoadBalancerMetricData' smart constructor.
data GetLoadBalancerMetricData = GetLoadBalancerMetricData'
  { _glbmdLoadBalancerName ::
      !Text,
    _glbmdMetricName ::
      !LoadBalancerMetricName,
    _glbmdPeriod ::
      !Nat,
    _glbmdStartTime ::
      !POSIX,
    _glbmdEndTime ::
      !POSIX,
    _glbmdUnit ::
      !MetricUnit,
    _glbmdStatistics ::
      ![MetricStatistic]
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'GetLoadBalancerMetricData' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'glbmdLoadBalancerName' - The name of the load balancer.
--
-- * 'glbmdMetricName' - The metric for which you want to return information. Valid load balancer metric names are listed below, along with the most useful @statistics@ to include in your request, and the published @unit@ value.     * __@ClientTLSNegotiationErrorCount@ __ - The number of TLS connections initiated by the client that did not establish a session with the load balancer due to a TLS error generated by the load balancer. Possible causes include a mismatch of ciphers or protocols. @Statistics@ : The most useful statistic is @Sum@ . @Unit@ : The published unit is @Count@ .     * __@HealthyHostCount@ __ - The number of target instances that are considered healthy. @Statistics@ : The most useful statistic are @Average@ , @Minimum@ , and @Maximum@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_2XX_Count@ __ - The number of HTTP 2XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_3XX_Count@ __ - The number of HTTP 3XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_4XX_Count@ __ - The number of HTTP 4XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_5XX_Count@ __ - The number of HTTP 5XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_LB_4XX_Count@ __ - The number of HTTP 4XX client error codes that originated from the load balancer. Client errors are generated when requests are malformed or incomplete. These requests were not received by the target instance. This count does not include response codes generated by the target instances. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_LB_5XX_Count@ __ - The number of HTTP 5XX server error codes that originated from the load balancer. This does not include any response codes generated by the target instance. This metric is reported if there are no healthy instances attached to the load balancer, or if the request rate exceeds the capacity of the instances (spillover) or the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@InstanceResponseTime@ __ - The time elapsed, in seconds, after the request leaves the load balancer until a response from the target instance is received. @Statistics@ : The most useful statistic is @Average@ . @Unit@ : The published unit is @Seconds@ .     * __@RejectedConnectionCount@ __ - The number of connections that were rejected because the load balancer had reached its maximum number of connections. @Statistics@ : The most useful statistic is @Sum@ . @Unit@ : The published unit is @Count@ .     * __@RequestCount@ __ - The number of requests processed over IPv4. This count includes only the requests with a response generated by a target instance of the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@UnhealthyHostCount@ __ - The number of target instances that are considered unhealthy. @Statistics@ : The most useful statistic are @Average@ , @Minimum@ , and @Maximum@ . @Unit@ : The published unit is @Count@ .
--
-- * 'glbmdPeriod' - The granularity, in seconds, of the returned data points.
--
-- * 'glbmdStartTime' - The start time of the period.
--
-- * 'glbmdEndTime' - The end time of the period.
--
-- * 'glbmdUnit' - The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units with each available metric, see the @metricName@ parameter.
--
-- * 'glbmdStatistics' - The statistic for the metric. The following statistics are available:     * @Minimum@ - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.     * @Maximum@ - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.     * @Sum@ - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.     * @Average@ - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.     * @SampleCount@ - The count, or number, of data points used for the statistical calculation.
getLoadBalancerMetricData ::
  -- | 'glbmdLoadBalancerName'
  Text ->
  -- | 'glbmdMetricName'
  LoadBalancerMetricName ->
  -- | 'glbmdPeriod'
  Natural ->
  -- | 'glbmdStartTime'
  UTCTime ->
  -- | 'glbmdEndTime'
  UTCTime ->
  -- | 'glbmdUnit'
  MetricUnit ->
  GetLoadBalancerMetricData
getLoadBalancerMetricData
  pLoadBalancerName_
  pMetricName_
  pPeriod_
  pStartTime_
  pEndTime_
  pUnit_ =
    GetLoadBalancerMetricData'
      { _glbmdLoadBalancerName =
          pLoadBalancerName_,
        _glbmdMetricName = pMetricName_,
        _glbmdPeriod = _Nat # pPeriod_,
        _glbmdStartTime = _Time # pStartTime_,
        _glbmdEndTime = _Time # pEndTime_,
        _glbmdUnit = pUnit_,
        _glbmdStatistics = mempty
      }

-- | The name of the load balancer.
glbmdLoadBalancerName :: Lens' GetLoadBalancerMetricData Text
glbmdLoadBalancerName = lens _glbmdLoadBalancerName (\s a -> s {_glbmdLoadBalancerName = a})

-- | The metric for which you want to return information. Valid load balancer metric names are listed below, along with the most useful @statistics@ to include in your request, and the published @unit@ value.     * __@ClientTLSNegotiationErrorCount@ __ - The number of TLS connections initiated by the client that did not establish a session with the load balancer due to a TLS error generated by the load balancer. Possible causes include a mismatch of ciphers or protocols. @Statistics@ : The most useful statistic is @Sum@ . @Unit@ : The published unit is @Count@ .     * __@HealthyHostCount@ __ - The number of target instances that are considered healthy. @Statistics@ : The most useful statistic are @Average@ , @Minimum@ , and @Maximum@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_2XX_Count@ __ - The number of HTTP 2XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_3XX_Count@ __ - The number of HTTP 3XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_4XX_Count@ __ - The number of HTTP 4XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_Instance_5XX_Count@ __ - The number of HTTP 5XX response codes generated by the target instances. This does not include any response codes generated by the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_LB_4XX_Count@ __ - The number of HTTP 4XX client error codes that originated from the load balancer. Client errors are generated when requests are malformed or incomplete. These requests were not received by the target instance. This count does not include response codes generated by the target instances. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@HTTPCode_LB_5XX_Count@ __ - The number of HTTP 5XX server error codes that originated from the load balancer. This does not include any response codes generated by the target instance. This metric is reported if there are no healthy instances attached to the load balancer, or if the request rate exceeds the capacity of the instances (spillover) or the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@InstanceResponseTime@ __ - The time elapsed, in seconds, after the request leaves the load balancer until a response from the target instance is received. @Statistics@ : The most useful statistic is @Average@ . @Unit@ : The published unit is @Seconds@ .     * __@RejectedConnectionCount@ __ - The number of connections that were rejected because the load balancer had reached its maximum number of connections. @Statistics@ : The most useful statistic is @Sum@ . @Unit@ : The published unit is @Count@ .     * __@RequestCount@ __ - The number of requests processed over IPv4. This count includes only the requests with a response generated by a target instance of the load balancer. @Statistics@ : The most useful statistic is @Sum@ . Note that @Minimum@ , @Maximum@ , and @Average@ all return @1@ . @Unit@ : The published unit is @Count@ .     * __@UnhealthyHostCount@ __ - The number of target instances that are considered unhealthy. @Statistics@ : The most useful statistic are @Average@ , @Minimum@ , and @Maximum@ . @Unit@ : The published unit is @Count@ .
glbmdMetricName :: Lens' GetLoadBalancerMetricData LoadBalancerMetricName
glbmdMetricName = lens _glbmdMetricName (\s a -> s {_glbmdMetricName = a})

-- | The granularity, in seconds, of the returned data points.
glbmdPeriod :: Lens' GetLoadBalancerMetricData Natural
glbmdPeriod = lens _glbmdPeriod (\s a -> s {_glbmdPeriod = a}) . _Nat

-- | The start time of the period.
glbmdStartTime :: Lens' GetLoadBalancerMetricData UTCTime
glbmdStartTime = lens _glbmdStartTime (\s a -> s {_glbmdStartTime = a}) . _Time

-- | The end time of the period.
glbmdEndTime :: Lens' GetLoadBalancerMetricData UTCTime
glbmdEndTime = lens _glbmdEndTime (\s a -> s {_glbmdEndTime = a}) . _Time

-- | The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units with each available metric, see the @metricName@ parameter.
glbmdUnit :: Lens' GetLoadBalancerMetricData MetricUnit
glbmdUnit = lens _glbmdUnit (\s a -> s {_glbmdUnit = a})

-- | The statistic for the metric. The following statistics are available:     * @Minimum@ - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.     * @Maximum@ - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.     * @Sum@ - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.     * @Average@ - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.     * @SampleCount@ - The count, or number, of data points used for the statistical calculation.
glbmdStatistics :: Lens' GetLoadBalancerMetricData [MetricStatistic]
glbmdStatistics = lens _glbmdStatistics (\s a -> s {_glbmdStatistics = a}) . _Coerce

instance AWSRequest GetLoadBalancerMetricData where
  type
    Rs GetLoadBalancerMetricData =
      GetLoadBalancerMetricDataResponse
  request = postJSON lightsail
  response =
    receiveJSON
      ( \s h x ->
          GetLoadBalancerMetricDataResponse'
            <$> (x .?> "metricName")
            <*> (x .?> "metricData" .!@ mempty)
            <*> (pure (fromEnum s))
      )

instance Hashable GetLoadBalancerMetricData

instance NFData GetLoadBalancerMetricData

instance ToHeaders GetLoadBalancerMetricData where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ( "Lightsail_20161128.GetLoadBalancerMetricData" ::
                     ByteString
                 ),
            "Content-Type"
              =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON GetLoadBalancerMetricData where
  toJSON GetLoadBalancerMetricData' {..} =
    object
      ( catMaybes
          [ Just ("loadBalancerName" .= _glbmdLoadBalancerName),
            Just ("metricName" .= _glbmdMetricName),
            Just ("period" .= _glbmdPeriod),
            Just ("startTime" .= _glbmdStartTime),
            Just ("endTime" .= _glbmdEndTime),
            Just ("unit" .= _glbmdUnit),
            Just ("statistics" .= _glbmdStatistics)
          ]
      )

instance ToPath GetLoadBalancerMetricData where
  toPath = const "/"

instance ToQuery GetLoadBalancerMetricData where
  toQuery = const mempty

-- | /See:/ 'getLoadBalancerMetricDataResponse' smart constructor.
data GetLoadBalancerMetricDataResponse = GetLoadBalancerMetricDataResponse'
  { _glbmdrrsMetricName ::
      !( Maybe
           LoadBalancerMetricName
       ),
    _glbmdrrsMetricData ::
      !( Maybe
           [MetricDatapoint]
       ),
    _glbmdrrsResponseStatus ::
      !Int
  }
  deriving
    ( Eq,
      Read,
      Show,
      Data,
      Typeable,
      Generic
    )

-- | Creates a value of 'GetLoadBalancerMetricDataResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'glbmdrrsMetricName' - The name of the metric returned.
--
-- * 'glbmdrrsMetricData' - An array of objects that describe the metric data returned.
--
-- * 'glbmdrrsResponseStatus' - -- | The response status code.
getLoadBalancerMetricDataResponse ::
  -- | 'glbmdrrsResponseStatus'
  Int ->
  GetLoadBalancerMetricDataResponse
getLoadBalancerMetricDataResponse pResponseStatus_ =
  GetLoadBalancerMetricDataResponse'
    { _glbmdrrsMetricName =
        Nothing,
      _glbmdrrsMetricData = Nothing,
      _glbmdrrsResponseStatus =
        pResponseStatus_
    }

-- | The name of the metric returned.
glbmdrrsMetricName :: Lens' GetLoadBalancerMetricDataResponse (Maybe LoadBalancerMetricName)
glbmdrrsMetricName = lens _glbmdrrsMetricName (\s a -> s {_glbmdrrsMetricName = a})

-- | An array of objects that describe the metric data returned.
glbmdrrsMetricData :: Lens' GetLoadBalancerMetricDataResponse [MetricDatapoint]
glbmdrrsMetricData = lens _glbmdrrsMetricData (\s a -> s {_glbmdrrsMetricData = a}) . _Default . _Coerce

-- | -- | The response status code.
glbmdrrsResponseStatus :: Lens' GetLoadBalancerMetricDataResponse Int
glbmdrrsResponseStatus = lens _glbmdrrsResponseStatus (\s a -> s {_glbmdrrsResponseStatus = a})

instance NFData GetLoadBalancerMetricDataResponse
